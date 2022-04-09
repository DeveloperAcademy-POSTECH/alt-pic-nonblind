//
//  mainList.swift
//  alt-pic-nonblind
//
//  Created by hyo on 2022/04/06.
//

import SwiftUI

struct MainListView: View {
    

    @State private var maxNumber: Int = 8
    var body: some View {
        ScrollView {
            LazyVStack(spacing:30) {
                ForEach(0...maxNumber, id: \.self) { num in
                    AltRow(altimage: altImageSample[num % 8])
                        .onAppear {
                            if num % 8 == 0 {
                                maxNumber += 8
                            }
                        }
                }
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
