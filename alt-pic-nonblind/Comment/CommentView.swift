//
//  CommentView.swift
//  alt-pic-nonblind
//
//  Created by 최동권 on 2022/04/06.
//

import SwiftUI

struct CommentView: View {
    @State var commentList: [String] = ["드넓은 호수를 향해 뻗은 손이 하얀색 컵을 쥐고 있다.","열락의 눈에 우리 우리의 있는 우리는 그리하였는가","굳이 하지 있는 그대만이 청춘의 빛나는 법칙과 마음을 그리는 거기까지가 오고가는 군종 너의 아픔을 간직하리라","굳이 하지 있는 그대만이 청춘의 빛나는 법칙과 마음을 그리는 거기까지가 오고가는 군종 너의 아픔을 간직하리라","굳이 하지 있는 그대만이 청춘의 빛나는 법칙과 마음을 그리는 거기까지가 오고가는 군종 너의 아픔을 간직하리라"]
    @State var nameList : [String] = ["dake1","dake2","dake3","dake4","dake5"]
    @State var likeList : [String] = ["18","10","5","4","3"]
    @State private var givenComment : String = ""
    @FocusState var isInputActive: Bool
    var imageLink = "https://post.naver.com/viewer/postView.naver?volumeNo=21378378&memberNo=15460571&vType=VERTICAL"
    
    
    var body: some View {
        
        NavigationView() {
            ZStack{
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
                    Divider()
                    List{
                        ForEach(0..<commentList.count){index in
                            HStack{
                                VStack {
                                    Spacer()
                                    Circle().frame(width:30,height:30)
                                    Text(nameList[index])
                                    Spacer()
                                }
                                VStack(alignment:.leading) {
                                    Text(commentList[index])
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
                }
                
                VStack{
                    Spacer()
                    HStack{
                        TextField(
                            "textfield",
                            text: $givenComment
                        ).background(.white).disableAutocorrection(true)
                            .toolbar{ToolbarItemGroup(placement: .keyboard) {
                                Spacer()
                                
                                Button("Done") {
                                    isInputActive = false
                                }
                            }
                                
                            }
                        
                        Button(action:{
                            print(self.$givenComment)
                        }){Image(systemName: "paperplane.fill")}
                    }
                }
            }
        }
    }
}


struct CommentView_Previews: PreviewProvider {
    static var previews: some View {
        CommentView()
    }
}
