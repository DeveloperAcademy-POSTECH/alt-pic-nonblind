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
    //
    //    var altimage : AltImageData
    //    var imageLink = altimage.imageUrl
    
    var body: some View {
        
        NavigationView() {
            
            VStack{
                HStack() {
                    
                    Spacer()
                    NavigationLink(destination:originalView()){
                        Text("원본확인")
                    }
                    .frame(width:70)
                    .padding().background(.black)
                    .cornerRadius(10).foregroundColor(.white)
                    .navigationBarTitle("")
                    .navigationBarHidden(true)
                    
                    
                    Spacer()
                        .frame(width:30)
                    
                    NavigationLink(destination: MyWebView(urlToLoad: imageLink)){
                        Text("링크이동")
                    }
                    .frame(width:70)
                    .padding().background(.black).cornerRadius(10).foregroundColor(.white)
                    Spacer()
                    
                }
                Divider()
                commentList()
            }
        }
    }
}

struct commentList: View{
    @State var comments: [String] = ["드넓은 호수를 향해 뻗은 손이 하얀색 컵을 쥐고 있다.","열락의 눈에 우리 우리의 있는 우리는 그리하였는가","굳이 하지 있는 그대만이 청춘의 빛나는 법칙과 마음을 그리는 거기까지가 오고가는 군종 너의 아픔을 간직하리라","굳이 하지 있는 그대만이 청춘의 빛나는 법칙과 마음을 그리는 거기까지가 오고가는 군종 너의 아픔을 간직하리라","굳이 하지 있는 그대만이 청춘의 빛나는 법칙과 마음을 그리는 거기까지가 오고가는 군종 너의 아픔을 간직하리라"]
    @State var nameList : [String] = ["Dake","Dani","Hardy","Lance","Monicaefdfefsdfef"]
    @State var likeList : [Int] = [18,10,5,4,3]
    @State private var givenComment : String = ""
    @State private var showingAlert = false
    @State var isLike = [false,false,false,false,false]
    
    @State var CommentDataSampleOrigin = [
        CommentData(writer: "Dake", writerProfileIamgeName: "profile", altText: "드넓은 호수를 향해 뻗은 손이 하얀색 컵을 쥐고 있다.", isLiked: false, like: ["Hardy","Dany"]),
        CommentData(writer: "Dany", writerProfileIamgeName: "profile", altText: "열락의 눈에 우리 우리의 있는 우리는 그리하였는가", isLiked: false, like: ["Hardy","Dake"]),
        CommentData(writer: "Lance", writerProfileIamgeName: "profile", altText: "굳이 하지 있는 그대만이 청춘의 빛나는 법칙과 마음을 그리는 거기까지가 오고가는 군종 너의 아픔을 간직하리라", isLiked: false, like: ["Hardy","Dany",]),
        CommentData(writer: "Hardy", writerProfileIamgeName: "profile", altText: "열락의 눈에 우리 우리의 있는 우리는 그리하였는가", isLiked: false, like: ["Lance","Dake","Monica"]),
        CommentData(writer: "Monica", writerProfileIamgeName: "profile", altText: "열락의 눈에 우리 우리의 있는 우리는 그리하였는가", isLiked: false, like: ["Hardy","Dake","Dake","Dany"])
    ]
    
    
    @FocusState private var nameIsFocused: Bool
    @FocusState var isInputActive: Bool
    
    let textLimit = 125 //Your limit
    
    var body: some View{
        CommentRowView(CommentDataSample: $CommentDataSampleOrigin)
        //        List{
        //            HStack {
        //                Spacer()
        //                Image("swim")
        //                    .resizable()
        //                    .frame(width:300, height: 400.0)
        //                Spacer()
        //
        //            }
        //            .listRowSeparator(.hidden)
        //            ForEach(0..<comments.count){ index in
        //                HStack{
        //                    VStack {
        //                        Spacer()
        //                        Image("profile")
        //                            .resizable()
        //                            .scaledToFit()
        //                            .frame(width: 30, height: 30)
        //                            .background(.gray)
        //                            .clipShape(Circle())
        //                        //                        Circle().frame(width:30,height:30)
        //                        Text(nameList[index])
        //                            .multilineTextAlignment(.center)
        //                            .fixedSize(horizontal: false, vertical: true)
        //                        Spacer()
        //                    }
        //                    .frame(width:60)
        //
        //                    VStack(alignment:.leading) {
        //                        Text(comments[index])
        //                            .fixedSize(horizontal: false, vertical: true)
        //                            .multilineTextAlignment(.leading)
        //                        HStack {
        //                            Button(action: {
        //                                self.isLike[index].toggle()
        //                            },label: {
        //                                Image(systemName: self.isLike[index] == true ? "heart.fill" : "heart")
        //                                    .foregroundColor(.red)
        //                                    .frame(width: 10, height: 10)
        //                                    .padding(.leading)
        //                            })
        //                            .buttonStyle(.plain)
        //
        //                            Text(isLike[index] == true ? "\(likeList[index] + 1)" : "\(likeList[index])")
        //                            Spacer()
        //                        }
        //                    }
        //                }
        //                .listRowSeparator(.hidden)
        //                .swipeActions(allowsFullSwipe: false) {
        //                    HStack {
        //                        if nameList[index] == "Dake"{
        //                            Button {
        //                                print("text deleted")
        //                            } label: {
        //                                Label("", systemImage: "trash")
        //                            }.tint(.red)
        //                        } else {
        //                            Button {
        //                                self.showingAlert = true
        //                            } label: {
        //                                Label("", systemImage: "bell.fill")
        //                            }
        //                            .tint(.gray)
        //                        }
        //                    }
        //                }
        //            }.alert(isPresented: $showingAlert) {
        //                Alert(title: Text("해당 텍스트를 신고하시겠습니까?"), primaryButton: .destructive(Text("신고"), action: {
        //                    // Some action
        //                }), secondaryButton: .cancel(Text("취소")))
        //            }
        //        }.listStyle(.plain)
        HStack{
            TextField(
                "textfield",
                text: $givenComment
            )
            .modifier(TextFieldClearButton(text: $givenComment))
            .multilineTextAlignment(.leading)
            .submitLabel(.done)
            .onReceive(Just(givenComment)) { _ in limitText(textLimit) }
            .focused($nameIsFocused)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .disableAutocorrection(true)
            .toolbar{ToolbarItemGroup(placement: .keyboard) {
                Spacer()
                
                Button("Done") {
                    nameIsFocused = false
                    isInputActive = false
                    CommentDataSampleOrigin.append( CommentData(writer: "Dake", writerProfileIamgeName: "profile", altText: "\(givenComment)", isLiked: false, like: []))
                    givenComment = ""
                }
            }
            }
            
            Button(action:{
                nameIsFocused = false
                print(self.$givenComment)
            }){Image(systemName: "paperplane.fill")}
                .background(.white)
            
        }
        // 이걸 없애니 keyboard와 textfield사이의 공간 사라짐 ? .keyboardResponsive()
    }
    func limitText(_ upper: Int) {
        if givenComment.count > upper {
            givenComment = String(givenComment.prefix(upper))
            //        }
        }
    }
    
    
    // textfield내의 텍스트 모두 지우기 버튼
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
}


struct CommentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            CommentView()
        }
    }
}
