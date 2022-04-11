//
//  Toast.swift
//  DaniLab
//
//  Created by Minkyeong Ko on 2022/04/11.
//

import SwiftUI

/*
 Toast View Modifier
    - 다른 View나 View modifier에 적용해서 새로운 버전 생성
*/struct Toast: ViewModifier {
    // 시간 설정
    static let short: TimeInterval = 1.5
    static let long: TimeInterval = 3.5
    
    // 필요한 변수들
    let message: String
    @Binding var isShowing: Bool
    let config: Config
    let bgColor: Color
    
    // 전체 View에 toastView를 겹친다
    func body(content: Content) -> some View {
        ZStack {    // toast alert가 겹쳐야 하니까 ZStack 사용
            content
            toastView
        }
    }
    
    // toastView 정의
    private var toastView: some View {
        VStack {
            Spacer()    // 위 여백
            if isShowing {
                // 실제 Toast
                Group {
                    Text(message)
                        .multilineTextAlignment(.center)
                        .foregroundColor(config.textColor)
                        .font(config.font)
                        .padding()
                }
                .frame(maxWidth: .infinity)
                .background(bgColor)
                .cornerRadius(8)
                .onTapGesture {     // 탭 하면 사라지게
                    isShowing = false
                }
                .onAppear {
                    // duration 이후 사라지게
                    DispatchQueue.main.asyncAfter(deadline: .now() + config.duration) {
                        isShowing = false
                    }
                }
            }
        }
        .animation(config.animation, value: isShowing)  // animation 적용
        .transition(config.transition)  // transition 적용
    }
    
    // Configuration
    struct Config {
        // 선언
        let textColor: Color
        let font: Font
        let backgroundColor: Color
        let duration: TimeInterval
        let transition: AnyTransition
        let animation: Animation
        
        // 초기화
        init(textColor: Color = .white,
             font: Font = .system(size: 14),
             backgroundColor: Color = .red,
             duration: TimeInterval = Toast.short,
             transition: AnyTransition = .opacity,
             animation: Animation = .linear(duration: 0.3)) {
          self.textColor = textColor
          self.font = font
          self.backgroundColor = backgroundColor
          self.duration = duration
          self.transition = transition
          self.animation = animation
        }
    }
}

// View에 toast라는 새로운 함수를 추가
extension View {
  func toast(message: String,
             isShowing: Binding<Bool>,
             bgColor: Color,
             duration: TimeInterval) -> some View {
                // View에 modifier 적용
                self.modifier(Toast(message: message,
                                    isShowing: isShowing,
                                    config: .init(duration: duration), bgColor: bgColor))
  }
}
