//
//  LimitTextInput.swift
//  DaniLab
//
//  Created by Minkyeong Ko on 2022/04/11.
//

import SwiftUI

/*
    TextField 글자수를 제한하는 View Modifier
*/
struct TextFieldLimitModifer: ViewModifier {
    @Binding var value: String
    var length: Int

    func body(content: Content) -> some View {
        content
            .onReceive(value.publisher.collect()) {
                value = String($0.prefix(length))
            }
    }
}

// View에 limitInputLength라는 새로운 함수를 추가
extension View {
    func limitInputLength(value: Binding<String>, length: Int) -> some View {
        self.modifier(TextFieldLimitModifer(value: value, length: length))
    }
}
