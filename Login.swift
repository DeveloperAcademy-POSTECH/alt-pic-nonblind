//
//  Login.swift
//  alt-pic-nonblind
//
//  Created by 부재원 on 2022/04/10.
//

import SwiftUI
import KakaoSDKUser

struct Login: View {
    func onKakaoLoginByAppTouched(_ sender: Any) {
     // 카카오톡 설치 여부 확인
      if (UserApi.isKakaoTalkLoginAvailable()) {
        // 카카오톡 로그인. api 호출 결과를 클로저로 전달.
        UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
            if let error = error {
                // 예외 처리 (로그인 취소 등)
                print(error)
            }
            else {
                print("loginWithKakaoTalk() success.")
               // do something
                _ = oauthToken
               // 어세스토큰
               let accessToken = oauthToken?.accessToken
            }
        }
      }
    }
    var body: some View {
        VStack {
            Text("인증하기")
                .font(.largeTitle)
            .fontWeight(.medium)
            .padding(.bottom, 50)
            
            ZStack {
                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Corner Radius@*/10.0/*@END_MENU_TOKEN@*/)
                    .frame(width:250, height:80)
                    .foregroundColor(.green)
                    .padding(.bottom,40)
                Text("네이버 로그인")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .padding(.bottom,40)
                    .padding(.leading,60)
                    .padding(30)
            }
            ZStack {
                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Corner Radius@*/10.0/*@END_MENU_TOKEN@*/)
                    .frame(width:250, height:80)
                    .foregroundColor(.yellow)
                    .padding(.bottom,40)
                Button("카카오톡 로그인") {
                    onKakaoLoginByAppTouched((Any).self)
                }
                    .font(.title2)
//                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .padding(.bottom,40)
                    .padding(.leading,60)
                    .padding(30)
            }
            ZStack {
                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Corner Radius@*/10.0/*@END_MENU_TOKEN@*/)
                    .frame(width:250, height:80)
                    .foregroundColor(.red)
                    .padding(.bottom,40)
                Text("구글 로그인")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .padding(.bottom,40)
                    .padding(.leading, 60)
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
