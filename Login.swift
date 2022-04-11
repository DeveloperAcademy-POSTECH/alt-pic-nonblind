//
//  Login.swift
//  alt-pic-nonblind
//
//  Created by 부재원 on 2022/04/10.
//

import SwiftUI

struct Login: View {
    var body: some View {
        VStack {
            Text("인증하기")
                .font(.largeTitle)
            .fontWeight(.medium)
            .padding(.bottom, 50)
            
            ZStack {
                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Corner Radius@*/10.0/*@END_MENU_TOKEN@*/)
                    .frame(width:220, height:60)
                    .foregroundColor(.green)
                    .padding(.bottom,40)
                Text("네이버 로그인")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .padding(.bottom,40)
                    .padding(30)
            }
            ZStack {
                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Corner Radius@*/10.0/*@END_MENU_TOKEN@*/)
                    .frame(width:220, height:60)
                    .foregroundColor(.yellow)
                    .padding(.bottom,40)
                Text("카카오톡 로그인")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .padding(.bottom,40)
                    .padding(30)
            }
            ZStack {
                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Corner Radius@*/10.0/*@END_MENU_TOKEN@*/)
                    .frame(width:220, height:60)
                    .foregroundColor(.red)
                    .padding(.bottom,40)
                Text("구글 로그인")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .padding(.bottom,40)
                    .padding(30)
            }
        }
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
