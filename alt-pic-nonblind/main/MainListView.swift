//
//  mainList.swift
//  alt-pic-nonblind
//
//  Created by hyo on 2022/04/06.
//

import SwiftUI

struct MainListView: View {
    
    @State private var maxNumber: Int = 8
    @Binding var altImageCommentData : [AltImageData]
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing:30) {
                ForEach(0...maxNumber, id: \.self) { num in
                    AltRow(altImageCommentElement: $altImageCommentData[num % 8])
                        .onAppear {
                            if num % 8 == 0 {
                                maxNumber += 8
                            }
                        }
                }
            }.padding(.top, 20)
        }
        
    }
}

struct AltRow: View {
//    let altimage: AltImageData
    @Binding var altImageCommentElement: AltImageData
    
    var body: some View {
        HStack{
            VStack(alignment: .leading, spacing: 2) {
                HStack(spacing: 2) {
                    Image(systemName: "bubble.left")
                    Text("\(altImageCommentElement.altNum)")
                }
                ImageView(altImageCommentElement: $altImageCommentElement, altimage: altImageCommentElement, frameWidth: 100, frameHeight: 100, cornerSize: 0)
            }
            HStack {
                RawImageView(altImageCommentElement: $altImageCommentElement)
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
