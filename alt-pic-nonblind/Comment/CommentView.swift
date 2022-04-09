//
//  CommentView.swift
//  alt-pic-nonblind
//
//  Created by 최동권 on 2022/04/06.
//

import SwiftUI
import Combine


//extension Publishers {
//    // 1.
//    static var keyboardHeight: AnyPublisher<CGFloat, Never> {
//        // 2.
//        let willShow = NotificationCenter.default.publisher(for: UIApplication.keyboardWillShowNotification)
//            .map { $0.keyboardHeight }
//
//        let willHide = NotificationCenter.default.publisher(for: UIApplication.keyboardWillHideNotification)
//            .map { _ in CGFloat(0) }
//
//        // 3.
//        return MergeMany(willShow, willHide)
//            .eraseToAnyPublisher()
//    }
//}
//extension Notification {
//    var keyboardHeight: CGFloat {
//        return (userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect)?.height ?? 0
//    }
//}

struct CommentView: View {
    let altImage: AltImageData
    
    var body: some View {
        
        NavigationView() {
            
            VStack{
                HStack {
                    Spacer()
                    NavigationLink(destination:Image(altImage.imageName)){
                        Text("원본확인")
                    }.padding().background(.black).cornerRadius(10).foregroundColor(.white)   .navigationBarTitle("")
                        .navigationBarHidden(true)
                    Spacer()
                    NavigationLink(destination: MyWebView(urlToLoad : altImage.imageUrl)){
                        Text("링크이동")
                    }.padding().background(.black).cornerRadius(10).foregroundColor(.white)
                    Spacer()
                }
                Divider()
                Image(altImage.imageName).resizable().frame(width:300, height: 400.0)
                Divider()
                commentList()
            }
            .ignoresSafeArea(.keyboard)
        }
    }
}

struct commentList: View{
    @State var comments: [String] = ["드넓은 호수를 향해 뻗은 손이 하얀색 컵을 쥐고 있다.","열락의 눈에 우리 우리의 있는 우리는 그리하였는가","굳이 하지 있는 그대만이 청춘의 빛나는 법칙과 마음을 그리는 거기까지가 오고가는 군종 너의 아픔을 간직하리라","굳이 하지 있는 그대만이 청춘의 빛나는 법칙과 마음을 그리는 거기까지가 오고가는 군종 너의 아픔을 간직하리라","굳이 하지 있는 그대만이 청춘의 빛나는 법칙과 마음을 그리는 거기까지가 오고가는 군종 너의 아픔을 간직하리라"]
    @State var nameList : [String] = ["dake1","dake2","dake3","dake4","dake5"]
    @State var likeList : [String] = ["18","10","5","4","3"]
    @State private var givenComment : String = ""
    @FocusState private var nameIsFocused: Bool
    @FocusState var isInputActive: Bool
    
    var body: some View{
        List{
            ForEach(0..<comments.count){index in
                HStack{
                    VStack {
                        Spacer()
                        Circle().frame(width:30,height:30)
                        Text(nameList[index])
                        Spacer()
                    }
                    VStack(alignment:.leading) {
                        Text(comments[index])
                        HStack {
                            Image(systemName: "heart.fill").frame(width: 10, height: 10).padding(.leading).foregroundColor(.red)
                            Text(likeList[index])
                            Spacer()
                        }
                    }
                }.padding(.horizontal).swipeActions {
                    Button {
                        print("Message deleted")
                    } label: {
                        Label("Delete", systemImage: "trash")
                    }.tint(.red)
                }
            }
        }.listStyle(.plain)
        HStack{
            TextField(
                "textfield",
                text: $givenComment
            )
            .focused($nameIsFocused)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .ignoresSafeArea(.keyboard, edges:.bottom).background(.white).disableAutocorrection(true)
            .toolbar{ToolbarItemGroup(placement: .keyboard) {
                Spacer()
                
                Button("Done") {
                    nameIsFocused = false
                    isInputActive = false
                }
            }
            }
            Button(action:{
                nameIsFocused = false
                print(self.$givenComment)
            }){Image(systemName: "paperplane.fill")}
        }
    }
}


struct CommentView_Previews: PreviewProvider {
    static var previews: some View {
        CommentView(altImage: altImageSample[0])
    }
}
