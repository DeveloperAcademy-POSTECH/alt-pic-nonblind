//
//  mainCard.swift
//  alt-pic-nonblind
//
//  Created by hyo on 2022/04/07.
//

import SwiftUI
struct MainView: View {
    @State private var isCardView = false
   
    var body: some View {
        NavigationView {
            VStack {
                if isCardView {
                    MainCardView() // 카드형
                } else {
                    MainListView() // 목록형
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

struct ImageView: View {
    let altimage: AltImageData
    let frameWidth: CGFloat
    let frameHeight: CGFloat
    let cornerSize: CGFloat

    var body: some View {
        NavigationLink(destination: CommentView(altImage: altimage)){
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
