//
//  mainList.swift
//  alt-pic-nonblind
//
//  Created by hyo on 2022/04/06.
//

import SwiftUI

struct MainListView: View {
    var body: some View {
            ScrollView {
                VStack(spacing:30) {
                    AltRow(altimage: altImageSample[0])
                    AltRow(altimage: altImageSample[1])
                    AltRow(altimage: altImageSample[2])
                    AltRow(altimage: altImageSample[3])
                    AltRow(altimage: altImageSample[4])
                    AltRow(altimage: altImageSample[5])
                    AltRow(altimage: altImageSample[6])
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
                
                NavigationLink(destination: AltListView()){
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
