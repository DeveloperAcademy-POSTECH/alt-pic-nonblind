//
//  EditProfileView.swift
//  DaniLab
//
//  Created by Minkyeong Ko on 2022/04/11.
//

import SwiftUI

struct ProfileEditView: View {
    /*
        Binding 값 가져오기
    */
    @Binding var nickname: String   // 닉네임
    @Binding var isWrongNickname: Bool  // 닉네임 체크
    @Binding var profileImage: Image    // 프로필 사진
    
    /*
         요소를 보여줄지 말지 체크
    */
    @FocusState var isInputActive: Bool     // Textfield
    @State var showButtons = false      // 아래쪽 버튼들
    @State private var showToast = false    // Toast 알림
    @State private var showPhotoLibrary = false    //  사진 목록
    @State private var showCamera = false   // 카메라
    
    @State private var currentName = ""
    
    // 모든 사용자의 이름들
    let allNames = ["Dani", "Lance", "Monica", "Hardy", "Dake"]
    
    // 선택될 사진을 담을 곳
    @State private var image = UIImage()
    
    // 선택된 버튼 저장
    @State private var selection = ""
    
    // 닉네임 리셋
    func resetNickname() {
        nickname = ""
    }
    
    /*
        View
    */
    var body: some View {
        VStack {
            ZStack (alignment: .bottomTrailing) {
                /*
                    프로필 사진 변경
                */
                // profileImage의 값이 업데이트 될 때 따라 변한다
                profileImage
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 130, height: 130)
                    .clipShape(Circle())
                // 사진 변경 버튼
                Button(action: {showButtons = true}) {
                    Image(systemName: "camera.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20, height: 20)
                        .padding(5.0)
                        .foregroundColor(.white)
                        .background(.black)
                        .clipShape(Circle())
                        .padding(10.0)
                }
                // 카메라 아이콘을 누르면 나오는 버튼 리스트
                .confirmationDialog("프로필 사진 설정", isPresented: $showButtons, titleVisibility: .visible) {
                    ForEach(["앨범에서 사진 선택", "사진 찍기", "기본 이미지로 변경"], id: \.self) { choice in
                        Button(action: {
                            selection = choice
                            if selection == "기본 이미지로 변경" {
                                profileImage = Image("default")
                            }
                            else if selection == "앨범에서 사진 선택" {
                                showPhotoLibrary = true
                            }
                            else {
                                showCamera = true
                            }
                        }) {
                            Text(choice)
                        }
                    }
                }
            }
            
            /*
                닉네임 변경
            */
            VStack {
                HStack {
                    TextField(nickname, text: $nickname)
                        .limitInputLength(value: $nickname, length: 20)     // 닉네임 길이 제한
                        .onChange(of: nickname) { newValue in
                            if allNames.contains(nickname) {
                                showToast = true
//                                nickname = String(currentName.prefix(upTo: currentName.index(before: currentName.endIndex)))
                            }
//                            else {
//                                nickname = currentName
//                            }
                        }
                        .font(.system(size: 20))
                        .focused($isInputActive)
                        .toolbar {
                            ToolbarItemGroup(placement: .keyboard) {
                                Spacer()

                                Button("Done") {
                                    isInputActive = false
                                }
                            }
                        }
                    
                    // 닉네임 리셋 버튼
                    Button(action: resetNickname) {
                        Image(systemName: "xmark.circle")
                    }
                }
                Divider()   // 가로선
                Text("\(nickname.count)/20")    // 닉네임 글자수 보여주기
            }
            .frame(width: 200)
            .padding()
            
            Spacer()
        }
        .padding(20.0)
        .sheet(isPresented: $showPhotoLibrary) {    // 사진 목록
            ImagePicker(sourceType: .photoLibrary, selectedImage: $image, profileImage: $profileImage)
        }
        .sheet(isPresented: $showCamera) {      // 카메라
            ImagePicker(sourceType: .camera, selectedImage: $image, profileImage: $profileImage)
        }
        .toast(message: "사용할 수 없는 사용자 이름입니다. 다른 이름을 사용하세요.",    // 사용중인 닉네임 알림
               isShowing: $showToast, bgColor: .red,
               duration: Toast.short)
    }
}


//struct EditProfileView_Previews: PreviewProvider {
//    static var previews: some View {
//        EditProfileView()
//    }
//}
