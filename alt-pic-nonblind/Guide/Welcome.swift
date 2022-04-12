//
//  ContentView.swift
//  alt-pic-nonblind
//
//  Created by hyo on 2022/04/05.
//

import SwiftUI

struct Welcome: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("듣는사진 도우미가 되신 것을 축하합니다!")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .padding(.bottom, 60.0)
                Image("icon")
                    .resizable()
                    .padding(.bottom)
                    .frame(width: 190,height: 200)
                Text("듣는사진은\n시각장애인을 위한\n대체텍스트 작성 공간이에요.\n어떻게 도와드릴 수 있는지\n간단히 살펴보고 시작할까요?")
                    .font(.title3)
                    .fontWeight(.light)
                    .multilineTextAlignment(.center)
                    .padding(.vertical, 40.0)
                    .lineSpacing(10)
                
                ZStack {
                    RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Corner Radius@*/10.0/*@END_MENU_TOKEN@*/)
                        .frame(width:52, height:40)
                        .padding(.bottom, 70.0)
                    NavigationLink(destination: GuidelineView()) { Text("GO")
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                            .padding(.bottom, 70.0)
                    }
                }
            }
        } .accentColor(.black)
    }
}

struct Welcome_Previews: PreviewProvider {
    static var previews: some View {
        Welcome()
    }
}
