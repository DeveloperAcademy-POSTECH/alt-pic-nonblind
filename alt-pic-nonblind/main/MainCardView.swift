//
//  MainCardView.swift
//  alt-pic-nonblind
//
//  Created by hyo on 2022/04/07.
//

import SwiftUI

struct MainCardView: View {
    @State private var imageName:String = "avocado"
    @State private var imageUrl:String = "http://www.naver.com"

    
    var body: some View {
            VStack {
                ScrollView(.horizontal){
                    HStack(spacing: 20) {
                        CardImage(altimage: altImageSample[0])
                        CardImage(altimage: altImageSample[1])
                        CardImage(altimage: altImageSample[2])
                        CardImage(altimage: altImageSample[3])
                        CardImage(altimage: altImageSample[4])
                        CardImage(altimage: altImageSample[5])
                    }
                }
                
                HStack {
                    RawImageView(imageName: imageName)
                    WebView(imageUrl: imageUrl)
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
                
                NavigationLink(destination: AltListView()){
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
        MainCardView()
    }
}

