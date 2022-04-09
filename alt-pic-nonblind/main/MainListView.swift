//
//  mainList.swift
//  alt-pic-nonblind
//
//  Created by hyo on 2022/04/06.
//

import SwiftUI

struct MainListView: View {
    
//    @State private var altImageNum: Int = altImageSample.count
    let altImageNum: Int = altImageSample.count
    
    var body: some View {
            ScrollView {
                VStack(spacing:30) {
                    ForEach(0..<7) {
                        AltRow(altimage: altImageSample[$0])
                    }
//                    ForEach(altImageSample, id: \.self) {
//                        AltRow(altimage: $0)
//                    }
                }
            }
    }
}

struct AltRow: View {
    let altimage: AltImageData
    
    var body: some View {
        HStack{
            VStack(alignment: .leading, spacing: 2) {
                HStack(spacing: 2) {
                    Image(systemName: "bubble.left")
                    Text("\(altimage.altNum)")
                }
                
                NavigationLink(destination: CommentView(altImage: altimage)){
                    Image(altimage.imageName)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                        .clipped()
                }
            }
            HStack {
                RawImageView(imageName: altimage.imageName)
                WebView(imageUrl: altimage.imageUrl)
            }
        }
        .frame(height: 110)
    }
}

struct mainList_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView {
                MainListView()
            }
            .previewInterfaceOrientation(.portrait)
        }
    }
}
