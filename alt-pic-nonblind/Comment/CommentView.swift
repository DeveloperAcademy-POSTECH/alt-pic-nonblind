//
//  CommentView.swift
//  alt-pic-nonblind
//
//  Created by 최동권 on 2022/04/06.
//

import SwiftUI
import Combine

struct CommentView: View {
    var imageLink = "https://post.naver.com/viewer/postView.naver?volumeNo=21378378&memberNo=15460571&vType=VERTICAL"
    
    var body: some View {
        
        NavigationView() {
            
            VStack{
                HStack {
                    Spacer()
                    NavigationLink(destination:originalView()){
                        Text("원본확인")
                    }.padding().background(.black).cornerRadius(10).foregroundColor(.white)   .navigationBarTitle("")
                        .navigationBarHidden(true)
                    Spacer()
                    NavigationLink(destination: MyWebView(urlToLoad: "https://naver.com")){
                        Text("링크이동")
                    }.padding().background(.black).cornerRadius(10).foregroundColor(.white)
                    Spacer()
                }
                Divider()
                Image("swim").resizable().frame(width:300, height: 400.0)
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
    
    let textLimit = 125 //Your limit
    
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
                }
                .padding(.horizontal)
                .swipeActions {
                    
                    HStack {
                        Button {
                            print("Message deleted")
                        } label: {
                            Label("Delete", systemImage: "trash")
                        }.tint(.red)
                        
                        Button {
                            print("Message deleted")
                        } label: {
                            Label("Report", systemImage: "bell.fill")
                        }.tint(.gray)
                    }
                }
                
            }
        }.listStyle(.plain)
        HStack{
            TextField(
                "textfield",
                text: $givenComment
            )
            .keyboardResponsive()
            .modifier(TextFieldClearButton(text: $givenComment))
            .multilineTextAlignment(.leading)
            .submitLabel(.done)
            .onReceive(Just(givenComment)) { _ in limitText(textLimit) }
            .focused($nameIsFocused)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .ignoresSafeArea(.keyboard, edges:.bottom).background(.black).disableAutocorrection(true)
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
    func limitText(_ upper: Int) {
        if givenComment.count > upper {
            givenComment = String(givenComment.prefix(upper))
        }
    }
}

struct TextFieldClearButton: ViewModifier {
    @Binding var text: String
    
    func body(content: Content) -> some View {
        HStack {
            content
            
            if !text.isEmpty {
                Button(
                    action: { self.text = "" },
                    label: {
                        Image(systemName: "delete.left")
                            .foregroundColor(Color(UIColor.opaqueSeparator))
                    }
                )
            }
        }
    }
}

// textfield가 키보드 바로 위에있게
struct KeyboardResponsiveModifier: ViewModifier {
    @State private var offset: CGFloat = 0
    
    func body(content: Content) -> some View {
        content
            .padding(.bottom, offset)
            .onAppear {
                NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main) { notif in
                    let value = notif.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
                    let height = value.height
                    let bottomInset = UIApplication.shared.windows.first?.safeAreaInsets.bottom
                    self.offset = height - (bottomInset ?? 0)
                }
                
                NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main) { notif in
                    self.offset = 0
                }
            }
    }
}

extension View {
    func keyboardResponsive() -> ModifiedContent<Self, KeyboardResponsiveModifier> {
        return modifier(KeyboardResponsiveModifier())
    }
}

struct CommentView_Previews: PreviewProvider {
    static var previews: some View {
        CommentView()
    }
}
