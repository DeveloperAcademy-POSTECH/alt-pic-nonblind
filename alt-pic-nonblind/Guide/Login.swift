//
//  Login.swift
//  alt-pic-nonblind
//
//  Created by 부재원 on 2022/04/10.
//

import SwiftUI
import KakaoSDKCommon
import KakaoSDKUser
import KakaoSDKAuth

struct Login: View {
    @State private var isLogin: Bool = false
    
    var body: some View {
        VStack {
            Text("인증하기")
                .font(.largeTitle)
            .fontWeight(.medium)
            .padding(.bottom, 50)
            
            Button {
                
            } label: {
                Image("naverlogin")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
            }
            
            if isLogin {
                Text("카카오 로그인 완료되었습니다")
                Button {
                    UserApi.shared.logout {(error) in
                        if let error = error {
                            print(error)
                        }
                        else {
                            print("logout() success.")
                            isLogin = false
                        }
                    }
                } label: {
                    Text("카카오 로그아웃")
                }
            }
            else {
                Text("카카오 로그아웃 완료되었습니다")
            }
            Button {
                // 카카오톡 설치 여부 확인
                if (UserApi.isKakaoTalkLoginAvailable()) {
                    UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                        if let error = error {
                            print(error)
                        }
                        else {
                            print("loginWithKakaoTalk() success.")

//                            //do something
                            if (AuthApi.hasToken()) {
                                UserApi.shared.accessTokenInfo { (_, error) in
                                    if let error = error {
                                        if let sdkError = error as? SdkError, sdkError.isInvalidTokenError() == true  {
                                            //로그인 필요
                                        }
                                        else {
                                            //기타 에러
                                        }
                                    }
                                    else {
                                        //토큰 유효성 체크 성공(필요 시 토큰 갱신됨)
                                        isLogin = true
                                    }
                                }
                            }
                            else {
                                //로그인 필요
                            }
                            _ = oauthToken
//                            UserApi.shared.me() {(user, error) in
//                                if let error = error {
//                                    print(error)
//                                }
//                                else {
//                                    print("me() success.")
//
//                                    //do something
////                                    _ = user
//
//                                    // 여기서 우리 서비스 가입 되어 있는지 체크
//                                    let checkuser = user?.id
//                                    print(checkuser)
//                                }
//                            }
                        }
                    }
                }
            } label: {
                Image("kakao_login_large_narrow")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
            }
            
            Button {
                
            } label: {
                Image("naverlogin")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
            }
        }
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
