//
//  TestWebView.swift
//  alt-pic-nonblind
//
//  Created by Minkyeong Ko on 2022/04/06.
//

import SwiftUI

struct TestView: View {
    var body: some View {
        NavigationView {
            NavigationLink (destination: MyWebView(urlToLoad: "https://www.naver.com").navigationTitle("웹사이트 방문").navigationBarTitleDisplayMode(.inline)) {
                Text("@link")
            }
            .navigationTitle("웹뷰 테스트")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
