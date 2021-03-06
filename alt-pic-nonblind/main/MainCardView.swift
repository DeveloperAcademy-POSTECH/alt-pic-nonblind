//
//  MainCardView.swift
//  alt-pic-nonblind
//
//  Created by hyo on 2022/04/07.
//

import SwiftUI

struct MainCardView: View {
    @State var currentIndex: Int = 0
    @Binding var altImageCommentData : [AltImageData]
    
    var body: some View {
        VStack {
            SnapCarousel(index: $currentIndex, items: altImageCommentData) {altimage in
                GeometryReader{proxy in
                    let size = proxy.size
                    
                    VStack(alignment: .leading, spacing: 2) {
                        HStack(spacing: 2) {
                            Image(systemName: "bubble.left")
                            Text("\(altimage.altNum)")
                        }
                        
                        ImageView(altImageCommentElement: $altImageCommentData[currentIndex],altimage: altimage, frameWidth: size.width, frameHeight: 450, cornerSize: 0)
                    }
                }
            }
            .padding(.top, 70)
            .frame(height: 550)
            
            HStack {
                RawImageView(altImageCommentElement: $altImageCommentData[currentIndex],frameWidth: 150, frmaeHeight: 40,fontSize: 17)
                WebView(imageUrl: altImageCommentData[currentIndex].imageUrl, frameWidth: 150, frmaeHeight: 40,fontSize: 17)
            }
            Spacer()
        }
    }
}

struct MainCardView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MainCardView(altImageCommentData: .constant([
                AltImageData(imageName: "apple", imageUrl: "https://www.naver.com", altNum: 5,imageComments: CommentDataSample),
                AltImageData(imageName: "avocado", imageUrl: "https://www.google.com", altNum: 20,imageComments: CommentDataSample),
                AltImageData(imageName: "banana", imageUrl: "https://www.naver.com", altNum: 21,imageComments: CommentDataSample),
                AltImageData(imageName: "blueberry", imageUrl: "https://www.naver.com", altNum: 3,imageComments: CommentDataSample),
                AltImageData(imageName: "cherry", imageUrl: "https://www.naver.com", altNum: 7,imageComments: CommentDataSample),
                AltImageData(imageName: "lemon", imageUrl: "https://www.naver.com", altNum: 3,imageComments: CommentDataSample),
                AltImageData(imageName: "lime", imageUrl: "https://www.naver.com", altNum: 7,imageComments: CommentDataSample)
            ]))
        }
    }
}

