//
//  Guideline 1.swift
//  alt-pic-nonblind
//
//  Created by 부재원 on 2022/04/07.
//

import SwiftUI

struct GuidelineView: View {
    var body: some View {
        ScrollView {
           HStack {
                PageView()
            }
        }
    }
}
        
struct Guideline_1_Previews: PreviewProvider {
    static var previews: some View {
        GuidelineView()
    }
}

struct PageView: View {
    var body: some View {
        VStack {
            Spacer()
                .frame(height: 80)
            
            TabView {
                ForEach(0..<30) { i in
                    ZStack {
                        Image("guideline1")
                            .resizable()
                            .frame(width:390,height:390)
                                        }.clipShape(RoundedRectangle(cornerRadius: 0.0, style: .continuous))
                                    }
                                    .padding(.all, 10)
                                }
                                .frame(width: UIScreen.main.bounds.width, height: 400)
                            .tabViewStyle(PageTabViewStyle())
        }
                        }
                    }
