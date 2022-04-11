//
//  BeforeLogin.swift
//  alt-pic-nonblind
//
//  Created by 부재원 on 2022/04/10.
//

import SwiftUI

struct BeforeLogin: View {
    var body: some View {
            NavigationView {
                VStack {
                    Text("완벽해요!\n그럼 이제,\n평등한 디지털 사회를\n만들러 가볼까요?")
                        .font(.title)
                        .fontWeight(.medium)
                    .multilineTextAlignment(.center)
                    .lineSpacing(10)
                    .padding(70)
                    
                    Spacer()
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Corner Radius@*/10.0/*@END_MENU_TOKEN@*/)
                            .frame(width:220, height:60)
                            .padding(.bottom,40)
                    NavigationLink(destination: Login()) { Text("인증하고 시작할게요")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                            .padding(.bottom,40)
                    }
                    }
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Corner Radius@*/10.0/*@END_MENU_TOKEN@*/)
                            .frame(width:220, height:60)
                            .padding(.bottom, 130)
                    NavigationLink(destination: Login()) { Text("일단 둘러볼게요")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                            .padding(.bottom, 130)

                    }
                    }
                    
            }
        }.accentColor(.black)
    }
}

struct BeforeLogin_Previews: PreviewProvider {
    static var previews: some View {
        BeforeLogin()
    }
}
