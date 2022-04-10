//
//  originalView.swift
//  comment
//
//  Created by 최동권 on 2022/04/07.
//

import SwiftUI

struct testView: View {
    @State var currentAmount: CGFloat = 0
    @State var lastAmount: CGFloat = 1
    var body: some View {
        Image("swim")
            .resizable()
            .scaleEffect(currentAmount + lastAmount)
            .gesture(
                MagnificationGesture()
                    .onChanged { value in
                        currentAmount = value - 1
                    }
            )
        
    }
}

struct originalView_Previews: PreviewProvider {
    static var previews: some View {
        testView()
    }
}
