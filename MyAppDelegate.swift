////
////  MyAppDelegate.swift
////
////  Created by Minkyeong Ko on 2022/04/11.
////
//
//import Foundation
//import UIKit
//import KakaoSDKCommon
//
//class MyAppDelegate: NSObject, UIApplicationDelegate {
//  func application(
//    _ application: UIApplication,
//    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil
//  ) -> Bool {
//    
//      KakaoSDK.initSDK(appKey: "5eec60357c4996c5c66fb8a00b27b0c6")
//      
//    return true
//  }
//    
//    func application(
//        _ application: UIApplication,
//        configurationForConnecting connectingSceneSession: UISceneSession,
//        options: UIScene.ConnectionOptions
//      ) -> UISceneConfiguration {
//        let sceneConfig = UISceneConfiguration(name: nil, sessionRole: connectingSceneSession.role)
//        sceneConfig.delegateClass = MySceneDelegate.self
//        return sceneConfig
//      }
//}
