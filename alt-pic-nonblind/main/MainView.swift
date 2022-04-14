//
//  mainCard.swift
//  alt-pic-nonblind
//
//  Created by hyo on 2022/04/07.
//

import SwiftUI
struct MainView: View {
    
    @State private var isCardView = false
    @State var altImageCommentData : [AltImageData] = [
            AltImageData(imageName: "apple", imageUrl: "https://www.naver.com", altNum: 5,imageComments: CommentDataSample),
            AltImageData(imageName: "paa1", imageUrl: "https://developeracademy.postech.ac.kr/ko/", altNum: 5,imageComments: CommentDataPresentationSample),
            AltImageData(imageName: "paa2", imageUrl: "https://developeracademy.postech.ac.kr/ko/", altNum: 5,imageComments: CommentDataSample),
            AltImageData(imageName: "avocado", imageUrl: "https://www.google.com", altNum: 20,imageComments: CommentDataSample),
            AltImageData(imageName: "banana", imageUrl: "https://www.naver.com", altNum: 21,imageComments: CommentDataSample),
            AltImageData(imageName: "blueberry", imageUrl: "https://www.naver.com", altNum: 3,imageComments: CommentDataSample),
            AltImageData(imageName: "cherry", imageUrl: "https://www.naver.com", altNum: 7,imageComments: CommentDataSample),
            AltImageData(imageName: "lemon", imageUrl: "https://www.naver.com", altNum: 3,imageComments: CommentDataSample),
            AltImageData(imageName: "lime", imageUrl: "https://www.naver.com", altNum: 7,imageComments: CommentDataSample),
            AltImageData(imageName: "musinsa", imageUrl: "https://www.naver.com", altNum: 10,imageComments: CommentDataSample)
        ]
    
    var body: some View {
        NavigationView {
            VStack {
                if isCardView {
                    MainCardView(altImageCommentData: $altImageCommentData) // 카드형
                } else {
                    MainListView(altImageCommentData: $altImageCommentData) // 목록형
                }
            }
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarItems(leading: profileImage, trailing: switchViewButton)
            .accentColor(.black)
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
                .padding(.vertical, 10)
                .padding(.horizontal,20)
                    .foregroundColor(.white)
                    .background(.black)
                    .cornerRadius(10)
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

struct ImageView: View {
    @Binding var altImageCommentElement: AltImageData
    var altimage : AltImageData
    
    let frameWidth: CGFloat
    let frameHeight: CGFloat
    let cornerSize: CGFloat

    var body: some View {
        NavigationLink(destination: CommentView(altImageCommentElement: $altImageCommentElement)){
            ZStack {
                Rectangle().fill(Color(uiColor: UIColor.systemGray6))
                Image(altimage.imageName)
                    .resizable()
                    .scaledToFit()
            }
            .frame(width: frameWidth, height: frameHeight)
            .cornerRadius(cornerSize)
        }
    }
}



struct RawImageView: View {

    @Binding var altImageCommentElement : AltImageData
    
    var body: some View {
        NavigationLink(destination: originalView(altImageCommentElement: $altImageCommentElement)){
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
