//
//  BadgesView.swift
//  alt-pic-nonblind
//
//  Created by Minkyeong Ko on 2022/04/06.
//

import SwiftUI

struct BadgesView: View {
    /*
        DUMMY_DATA
    */
    let data = (1...50).map { "\($0)" }
    
    // columns 정의
    let columns = [
       GridItem(.flexible()),
       GridItem(.flexible()),
       GridItem(.flexible())
   ]
    
    var body: some View {
        ScrollView {
            // 가로 3개씩 배치
            LazyVGrid(columns: columns, spacing: 20) {  // 세로줄 개수와 위아래 간격 지정
                ForEach(data, id: \.self) { item in
                    // 뱃지
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
