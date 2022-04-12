//
//  mainCard.swift
//  alt-pic-nonblind
//
//  Created by hyo on 2022/04/07.
//

import SwiftUI
struct MainView: View {
    @State private var isCardView = false
   
    // data : altimagedata + dake's comment
    @State var altImageCommentData : [AltImageData] = [
        AltImageData(imageName: "apple", imageUrl: "https://www.naver.com", altNum: 5,imageComments: CommentDataSample),
        AltImageData(imageName: "avocado", imageUrl: "https://www.google.com", altNum: 20,imageComments: CommentDataSample),
        AltImageData(imageName: "banana", imageUrl: "https://www.naver.com", altNum: 21,imageComments: CommentDataSample),
        AltImageData(imageName: "blueberry", imageUrl: "https://www.naver.com", altNum: 3,imageComments: CommentDataSample),
        AltImageData(imageName: "cherry", imageUrl: "https://www.naver.com", altNum: 7,imageComments: CommentDataSample),
        AltImageData(imageName: "lemon", imageUrl: "https://www.naver.com", altNum: 3,imageComments: CommentDataSample),
        AltImageData(imageName: "lime", imageUrl: "https://www.naver.com", altNum: 7,imageComments: CommentDataSample)
    ]
    
    
    var body: some View {
        NavigationView {
            VStack {
                if isCardView {
                    MainCardView() // 카드형
                } else {
                    MainListView(altImageCommentData: $altImageCommentData) // 목록형
                }
            }
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarItems(leading: profileImage, trailing: switchViewButton)
        }
    }
}

private extension MainView {
    func switchMainView(){
        isCardView = !isCardView
    }
    var switchViewButton: some View {
        Button(action: {switchMainView()}){
                Text("\(isCardView ? "목록형" : "카드형")")
                    .padding()
            }
    }
    var profileImage: some View {
        NavigationLink(destination: UserProfileView()){
            Image(systemName: "person.crop.circle")
                .padding()
                .imageScale(.large)
        }
    }
}

struct RawImageView: View {
    let imageName: String
    
    var body: some View {
        NavigationLink(destination: Image(imageName)){
            Text("원본 확인")
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).strokeBorder())
        }
    }
}

struct WebView: View {
    let imageUrl: String
    
    var body: some View {
        NavigationLink(destination: MyWebView(urlToLoad: imageUrl)){
            Text("링크 확인")
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).strokeBorder())
        }
    }
}

// MARK: - preview

struct mainCard_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
