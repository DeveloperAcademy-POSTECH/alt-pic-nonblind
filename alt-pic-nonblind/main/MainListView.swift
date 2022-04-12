//
//  mainList.swift
//  alt-pic-nonblind
//
//  Created by hyo on 2022/04/06.
//

import SwiftUI

struct MainListView: View {
    
    @Binding var altImageCommentData : [AltImageData]
//    @State private var altImageNum: Int = altImageSample.count
    
//    let altImageNum: Int = altImageSample.count
    
    var body: some View {
            ScrollView {
                VStack(spacing:30) {
                    ForEach(0..<7) {
                        AltRow(altImageCommentElement: $altImageCommentData[$0])
                    }
//                    ForEach(altImageSample, id: \.self) {
//                        AltRow(altimage: $0)
//                    }
                }
            }
    }
}

struct AltRow: View {
//    let altimage : AltImageData
    @Binding var altImageCommentElement: AltImageData
    
    var body: some View {
        HStack{
            VStack(alignment: .leading, spacing: 2) {
                HStack(spacing: 2) {
                    Image(systemName: "bubble.left")
                    Text("\(altImageCommentElement.altNum)")
                }
                
                NavigationLink(destination: CommentView(altImageCommentElement: $altImageCommentElement)){
                    Image(altImageCommentElement.imageName)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                        .clipped()
                }
            }
            HStack {
                RawImageView(imageName: altImageCommentElement.imageName)
                WebView(imageUrl: altImageCommentElement.imageUrl)
            }
        }
        .frame(height: 110)
    }
}

struct mainList_Previews: PreviewProvider {

    static var previews: some View {
        Group {
            NavigationView {
                MainListView(altImageCommentData: .constant([
                    AltImageData(imageName: "apple", imageUrl: "https://www.naver.com", altNum: 5,imageComments: CommentDataSample),
                    AltImageData(imageName: "avocado", imageUrl: "https://www.google.com", altNum: 20,imageComments: CommentDataSample),
                    AltImageData(imageName: "banana", imageUrl: "https://www.naver.com", altNum: 21,imageComments: CommentDataSample),
                    AltImageData(imageName: "blueberry", imageUrl: "https://www.naver.com", altNum: 3,imageComments: CommentDataSample),
                    AltImageData(imageName: "cherry", imageUrl: "https://www.naver.com", altNum: 7,imageComments: CommentDataSample),
                    AltImageData(imageName: "lemon", imageUrl: "https://www.naver.com", altNum: 3,imageComments: CommentDataSample),
                    AltImageData(imageName: "lime", imageUrl: "https://www.naver.com", altNum: 7,imageComments: CommentDataSample)
                ]))
            }
            .previewInterfaceOrientation(.portrait)
        }
    }
}
