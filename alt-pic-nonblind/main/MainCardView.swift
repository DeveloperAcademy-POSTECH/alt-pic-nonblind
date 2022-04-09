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
                SnapCarousel(index: $currentIndex, items: altImageSample) {post in
                    NavigationLink(destination: AltListView()){
                        GeometryReader{proxy in
                            let size = proxy.size
                                ZStack {
                                    Rectangle().fill(Color(uiColor: UIColor.systemGray6))
                                    Image(post.imageName)
                                        .resizable()
                                        .scaledToFit()
                                }
                                .frame(width: size.width, height: 400)
                                .cornerRadius(12)
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

struct CardImage: View {
    let altimage: AltImageData
    
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 2) {
                HStack(spacing: 2) {
                    Image(systemName: "bubble.left")
                    Text("\(altimage.altNum)")
                }
                
                NavigationLink(destination: CommentView(altImage: altimage)){
                    Image(altimage.imageName)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 310, height: 410)
                        .clipped()
                }
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

