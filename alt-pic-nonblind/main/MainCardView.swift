//
//  MainCardView.swift
//  alt-pic-nonblind
//
//  Created by hyo on 2022/04/07.
//

import SwiftUI

struct MainCardView: View {
    @State var currentIndex: Int = 0
    
    var body: some View {
        VStack {
            SnapCarousel(index: $currentIndex, items: altImageSample) {altimage in
                NavigationLink(destination: AltListView()){
                    GeometryReader{proxy in
                        let size = proxy.size
                        
                        VStack(alignment: .leading, spacing: 2) {
                            HStack(spacing: 2) {
                                Image(systemName: "bubble.left")
                                Text("\(altimage.altNum)")
                            }
                            ImageView(altimage: altimage, frameWidth: size.width, frameHeight: 400, cornerSize: 12)
                        }
                    }
                }
            }
            .padding(.vertical,40)
            
            HStack {
                RawImageView(imageName: altImageSample[currentIndex].imageName)
                WebView(imageUrl: altImageSample[currentIndex].imageUrl)
            }
        }
    }
}

struct MainCardView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MainCardView()
        }
    }
}

