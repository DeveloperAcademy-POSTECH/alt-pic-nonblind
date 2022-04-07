//
//  UserProfileView.swift
//  alt-pic-nonblind
//
//  Created by Minkyeong Ko on 2022/04/06.
//

import SwiftUI

struct UserProfileView: View {
    var colors = ["작성 이력", "채택 이력"]
    var texts: [String] = ["호수를 향해 뻗은 손이 하얀색 컵을 쥐고 있다.", "열락의 눈에 우리 우리의 있는 우리는 그리하였는가?", "가슴에 있음으로써 새 끝까지 이성은 운다. 가는 청춘은 무엇을 피고 있다.", "기다리다 지친 도로 위 가지 피는 이제 들어온다.", "피는 목숨이 꽃 돋고, 설산에서 현저하게 피가이다.", "천하를 없으면 이상은 부패뿐이다.", "오아이스도 타오르고 이 못하다 청춘은 아니다.", "얼마나 군영과 피고, 힘차게 것이다.", "이상의 그와 하는 이는 얼음과 싸인 얼음 황금시대다.", "없으면 피가 끝까지 일월과 있을 못하다.", "그와 얼음에 무엇을 하는 관현악이며, 피가 자신과 노래하며 수 때문이다. 피는 대한 사라지지 가슴이 따뜻한 바이며, 그들은 앞이 뜨고, 있다."]
    
    @State private var selectedTab = "작성 이력"
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Image("profile")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .background(.gray)
                        .clipShape(Circle())
                    Spacer()
                    VStack {
                        Text("nickname")
                            .font(.title)
                        NavigationLink (destination: ProfileEditView()) {
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
                
                VStack {
                    HStack {
                        Text("활동 배지")
                            .foregroundColor(Color(white: 0.63))
                        Spacer()
                        NavigationLink (destination: BadgesView()) {
                                Text("더 보기")
                        }
                    }
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
                
                VStack {
                    Picker("원하는 색을 골라주세요", selection: $selectedTab) {
                            ForEach(colors, id: \.self) {
                                Text($0)
                            }
                    }
                    .pickerStyle(.segmented)
                    .padding()
                    
    //                Text("당신은 '\(selectedColor)'을 선택하였습니다.").padding()
                    
                
                    if selectedTab == "작성 이력" {
                        List(texts, id: \.self) { text in
                            Text(text)
                        }
                    }
                    else {
                        List {
                            ForEach(0..<20) {
                                Text("채택 이력 \($0)")
                            }
                        }
                    }
                }
            }
            .padding([.top, .leading, .trailing])
        }
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView()
    }
}
