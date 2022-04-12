//
//  alt_pic_nonblindApp.swift
//  alt-pic-nonblind
//
//  Created by hyo on 2022/04/05.
//

import SwiftUI
import KakaoSDKCommon
import KakaoSDKAuth

@main
struct alt_pic_nonblindApp: App {
//    @UIApplicationDelegateAdaptor var delegate: MyAppDelegate
    init() {
        KakaoSDK.initSDK(appKey: "5eec60357c4996c5c66fb8a00b27b0c6")
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
//            Welcome().onOpenURL(perform: { url in
//                if (AuthApi.isKakaoTalkLoginUrl(url)) {
//                    AuthController.handleOpenUrl(url: url)
//                }
//            })
        }
    }
}
//hello
