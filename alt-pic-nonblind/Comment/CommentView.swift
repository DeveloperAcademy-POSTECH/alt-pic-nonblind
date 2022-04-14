//
//  CommentView.swift
//  alt-pic-nonblind
//
//  Created by 최동권 on 2022/04/06.
//

//
//  CommentView.swift
//  alt-pic-nonblind
//
//  Created by 최동권 on 2022/04/06.
//
import SwiftUI
import Combine

struct CommentView: View {
    
    @State private var showingAlert = false
    
    @Binding var altImageCommentElement: AltImageData
    
    var body: some View {
        
        
        
        VStack{
            Divider()
            List{
                HStack {
                    Spacer()
                    Image(altImageCommentElement.imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width:300, height: 400.0)
                    Spacer()
                }
                .listRowSeparator(.hidden)
                ForEach(altImageCommentElement.imageComments.sorted(by: { $0.like.count > $1.like.count }), id:\.self){ sample in
                    commentRow(comment: sample)
                        .listRowSeparator(.hidden)
                        .swipeActions(allowsFullSwipe: false) {
                            HStack {
                                if sample.writer == "Dake"{
                                    Button {
                                        if let index = altImageCommentElement.imageComments.firstIndex(of: sample){
                                            altImageCommentElement.imageComments.remove(at: index)
                                        }
                                        
                                    } label: {
                                        Label("", systemImage: "trash")
                                    }.tint(.red)
                                } else {
                                    Button {
                                        self.showingAlert = true
                                    } label: {
                                        Label("", systemImage: "bell.fill")
                                    }
                                    .tint(.gray)
                                }
                            }
                        }
                        .alert(isPresented: $showingAlert) {
                            Alert(title: Text("해당 텍스트를 신고하시겠습니까?"), primaryButton: .destructive(Text("신고"), action: {
                                // 신고와 관련된 func
                            }), secondaryButton: .cancel(Text("취소")))
                        }
                }
            }
            .listStyle(.plain)
            TextFieldView(CommentDataSampleOrigin: $altImageCommentElement.imageComments)
        }
        .navigationBarItems(leading: originalButton)
    }
}

private extension CommentView {
    
    var originalButton: some View {
        HStack{
//            Spacer()
//                .frame(width:3)
            NavigationLink(destination:originalView(altImageCommentElement: $altImageCommentElement)){
                Text("원본 확인")
                    .font(Font.system(size:15, design: .default))
                    .frame(width:128)
                    .padding(4)
                    .background(.black)
                    .cornerRadius(10).foregroundColor(.white)
            }
            
            .navigationBarTitle("")
            .navigationBarBackButtonHidden(false)
            
            NavigationLink(destination: MyWebView(urlToLoad: altImageCommentElement.imageUrl)){
                Text("링크 이동")
                    .font(Font.system(size:15, design: .default))
                    .frame(width:128)
                    .padding(4).background(.black)
                    .cornerRadius(10).foregroundColor(.white)
            }
            
        }
    }
}



// 사진 + 댓글창 in List
struct CommentRowView: View {
    
    @State private var showingAlert = false
    
    @Binding var altImageCommentElementComment : [CommentData]
    
    var body: some View {
        List{
            HStack {
                Spacer()
                Image("swim")
                    .resizable()
                    .frame(width:300, height: 400.0)
                Spacer()
            }
            .listRowSeparator(.hidden)
            ForEach(altImageCommentElementComment.sorted(by: { $0.like.count > $1.like.count }), id:\.self){ sample in
                commentRow(comment: sample)
                    .listRowSeparator(.hidden)
                    .swipeActions(allowsFullSwipe: false) {
                        HStack {
                            if sample.writer == "Dake"{
                                Button {
                                    if let index = altImageCommentElementComment.firstIndex(of: sample){
                                        altImageCommentElementComment.remove(at: index)
                                    }
                                    
                                } label: {
                                    Label("", systemImage: "trash")
                                }.tint(.red)
                            } else {
                                Button {
                                    self.showingAlert = true
                                } label: {
                                    Label("", systemImage: "bell.fill")
                                }
                                .tint(.gray)
                            }
                        }
                    }
                    .alert(isPresented: $showingAlert) {
                        Alert(title: Text("해당 텍스트를 신고하시겠습니까?"), primaryButton: .destructive(Text("신고"), action: {
                            // 신고와 관련된 func
                        }), secondaryButton: .cancel(Text("취소")))
                    }
            }
        }
        .listStyle(.plain)
    }
}

struct commentRow : View{
    @State private var showingAlert = false
    
    @State var comment : CommentData
    
    var body: some View {
        HStack{
            VStack {
                Spacer()
                Image(comment.writerProfileIamgeName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
                    .background(.gray)
                    .clipShape(Circle())
                Text(comment.writer)
                Spacer()
            }
            .frame(width:60)
            
            VStack(alignment:.leading) {
                Text(comment.altText)
                    .fixedSize(horizontal: false, vertical: true)
                    .multilineTextAlignment(.leading)
                HStack {
                    Button(action: {
                        self.comment.isLiked.toggle()
                    }){
                        Image(systemName: comment.isLiked == true ? "heart.fill" : "heart")
                            .foregroundColor(.red)
                            .frame(width: 10, height: 10)
                    }.padding(.leading, 5)
                        .buttonStyle(.plain)
                    Text(comment.isLiked == true ? "\(comment.like.count + 1)" : "\(comment.like.count)")
                    
                    Spacer()
                }
            }
        }
    }
}

//  textfield 뷰
struct TextFieldView: View{
    
    @Binding var CommentDataSampleOrigin: [CommentData]
    
    @State private var givenComment : String = ""
    @State private var showingAlert = false
    
    //
    @FocusState private var nameIsFocused: Bool
    @FocusState var isInputActive: Bool
    
    let textLimit = 125 //Your limit
    
    
    var body: some View{
        
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
                    CommentDataSampleOrigin.append( CommentData(writer: "Dake", writerProfileIamgeName: "bisil", altText: "\(givenComment)", isLiked: false, like: []))
                    givenComment = ""
                }
            }
            }
            
            Button(action:{
                nameIsFocused = false
                CommentDataSampleOrigin.append( CommentData(writer: "Dake", writerProfileIamgeName: "bisil", altText: "\(givenComment)", isLiked: false, like: []))
                givenComment = ""
            }){Image(systemName: "paperplane.fill")}
                .background(.white)
                .foregroundColor(.black)
            
        }
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
        CommentView(altImageCommentElement: .constant(AltImageData(imageName: "apple", imageUrl: "https://www.naver.com", altNum: 5,imageComments: CommentDataSample)))
    }
}
