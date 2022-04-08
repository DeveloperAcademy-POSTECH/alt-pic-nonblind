//
//  BadgesView.swift
//  alt-pic-nonblind
//
//  Created by Minkyeong Ko on 2022/04/06.
//

import SwiftUI

struct BadgesView: View {
    let data = (1...50).map { "\($0)" }
    
    let columns = [
       GridItem(.flexible()),
       GridItem(.flexible()),
       GridItem(.flexible())
   ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(data, id: \.self) { item in
                    VStack {
                        let testnum: Int = Int(item)!%3 + 1
                        let testimage = "badge\(testnum)"
                        Image(testimage)
                        Text("뱃지 \(item)")
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}

struct BadgesView_Previews: PreviewProvider {
    static var previews: some View {
        BadgesView()
    }
}
