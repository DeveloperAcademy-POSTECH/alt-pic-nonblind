//
//  ProfileEditView.swift
//  alt-pic-nonblind
//
//  Created by Minkyeong Ko on 2022/04/06.
//

import SwiftUI

struct ProfileEditView: View {
    @State private var nickname: String = ""
    @FocusState var isInputActive: Bool
    @State var showingSheet = false
    @State private var selection = "기본"
    @State private var profileImage = "profileImage"
    let bannedName = "Dani"
    
    func resetNickname() {
        nickname = ""
    }
    
    var body: some View {
        VStack {
            Text("\(selection)")
            ZStack (alignment: .bottomTrailing) {
                Image(profileImage)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 130, height: 130)
                    .clipShape(Circle())
                Button(action: {showingSheet = true}) {
                    Image(systemName: "camera.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20, height: 20)
                        .padding(5.0)
                        .foregroundColor(.white)
                        .background(.gray)
                        .clipShape(Circle())
                        .padding(10.0)
                }
                .confirmationDialog("프로필 사진 설정", isPresented: $showingSheet, titleVisibility: .visible) {
                    ForEach(["앨범에서 사진 선택", "사진 찍기", "기본 이미지로 변경"], id: \.self) { color in
                        Button(action: {
                            selection = color
                            if selection == "기본 이미지로 변경" {
                                profileImage = "default"
                            }
                        }) {
                            Text(color)
                        }
                    }
                }
            }
            VStack {
                HStack {
                    TextField("Placeholder", text: $nickname)
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
                    
                    Button(action: resetNickname) {
                        Image(systemName: "xmark.circle")
                    }
                }
                Divider()
                Text("\(nickname.count)/20")
            }
            .frame(width: 200)
            .padding()
            
            Spacer()
        }
        .padding(20.0)
    }
}

struct ProfileEditView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileEditView()
    }
}
