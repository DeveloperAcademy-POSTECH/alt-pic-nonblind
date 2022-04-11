//
//  ProfileView.swift
//  DaniLab
//
//  Created by Minkyeong Ko on 2022/04/11.
//

import SwiftUI

struct UserProfileView: View {
    /*
        Data Binding - View 사이 데이터 공유
    */
    // ProfileEditView, ImagePicker와 공유
    @State var nickname: String = "Dan"
    @State var isWrongNickname: Bool = false
    @State var profileImage: Image = Image("profileTest")
    
    /*
        DUMMY_DATA
    */
    var allTexts: [String] = ["호수를 향해 뻗은 손이 하얀색 컵을 쥐고 있다.", "열락의 눈에 우리 우리의 있는 우리는 그리하였는가?", "가슴에 있음으로써 새 끝까지 이성은 운다. 가는 청춘은 무엇을 피고 있다.", "기다리다 지친 도로 위 가지 피는 이제 들어온다.", "피는 목숨이 꽃 돋고, 설산에서 현저하게 피가이다.", "천하를 없으면 이상은 부패뿐이다.", "오아이스도 타오르고 이 못하다 청춘은 아니다.", "얼마나 군영과 피고, 힘차게 것이다.", "이상의 그와 하는 이는 얼음과 싸인 얼음 황금시대다.", "없으면 피가 끝까지 일월과 있을 못하다.", "그와 얼음에 무엇을 하는 관현악이며, 피가 자신과 노래하며 수 때문이다. 피는 대한 사라지지 가슴이 따뜻한 바이며, 그들은 앞이 뜨고, 있다."]    // 작성 이력
    var selectedTexts: [String] = ["피는 목숨이 꽃 돋고, 설산에서 현저하게 피가이다.", "천하를 없으면 이상은 부패뿐이다.", "오아이스도 타오르고 이 못하다 청춘은 아니다.", "얼마나 군영과 피고, 힘차게 것이다.", "이상의 그와 하는 이는 얼음과 싸인 얼음 황금시대다.", "없으면 피가 끝까지 일월과 있을 못하다."]    // 채택 이력
    
    /*
        Picker
    */
    var pickers = ["작성 이력", "채택 이력"]    // 탭 목록
    @State private var selectedTab = "작성 이력"    // 선택된 탭 저장
    
    /*
        View
    */
    var body: some View {
        NavigationView {
            VStack {
                /*
                    상단
                */
                HStack {
                    // 프로필 이미지
                    profileImage
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 100)
                        .background(.gray)
                        .clipShape(Circle())
                    Spacer()
                    // 닉네임, 프로필 편집
                    VStack {
                        Text(nickname)
                            .font(.title)
                        NavigationLink (destination: ProfileEditView(nickname: $nickname, isWrongNickname: $isWrongNickname, profileImage: $profileImage)) {
                            Text("프로필 편집하기")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .foregroundColor(Color(white: 0.63))
                                .background(Color(white: 0.96))
                                .cornerRadius(8)
                        }.navigationTitle("나의 프로필")
                        .navigationBarTitleDisplayMode(.inline)
                    }.frame(width: 180)
                }.padding()
                
                /*
                    중앙
                */
                VStack {
                    // 타이틀 및 더보기 버튼
                    HStack {
                        Text("활동 배지")
                            .foregroundColor(Color(white: 0.63))
                        Spacer()
                        NavigationLink (destination: BadgesView()) {
                                Text("더 보기")
                        }
                    }
                    // 배지 미리보기
                    HStack {
                        Image("badge1")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding()
                        Image("badge2")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding()
                        Image("badge3")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding()
                    }.background(Color(white: 0.96))
                        .cornerRadius(20)
                }.padding()
                
                /*
                    하단
                */
                VStack {
                    // Picker(탭) 선택
                    Picker("작성 이력 또는 채택 이력 보기", selection: $selectedTab) {
                            // 탭 나열
                            ForEach(pickers, id: \.self) {
                                Text($0)
                            }
                    }
                    .pickerStyle(.segmented)
                    .padding()
                
                    // 작성 이력 혹은 채택 이력 List
                    if selectedTab == "작성 이력" {
                        List(allTexts, id: \.self) { text in
                            Text(text)
                        }
                    }
                    else {
                        List(selectedTexts, id: \.self) { text in
                            Text(text)
                        }
                    }
                }
            }
        }
    }
}

struct UserProfileview_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView()
    }
}
