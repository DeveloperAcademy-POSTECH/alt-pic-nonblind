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
        
        NavigationView() {
            
            VStack{
                HStack() {
                    
                    Spacer()
                    NavigationLink(destination:originalView(altImageCommentElement: $altImageCommentElement)){
                        Text("원본확인")
                    }
                    .frame(width:70)
                    .padding().background(.black)
                    .cornerRadius(10).foregroundColor(.white)
                    .navigationBarTitle("")
                    .navigationBarHidden(true)
                    
                    
                    Spacer()
                        .frame(width:30)
                    
                    NavigationLink(destination: MyWebView(urlToLoad: altImageCommentElement.imageUrl)){
                        Text("링크이동")
                    }
                    .frame(width:70)
                    .padding().background(.black).cornerRadius(10).foregroundColor(.white)
                    Spacer()
                    
                }
                Divider()
                
                // 어떻게 해야하지..
                //                CommentRowView(CommentDataSampleOrigin: $CommentDataSampleOrigin)
                List{
                    HStack {
                        Spacer()
                        Image(altImageCommentElement.imageName)
                            .resizable()
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
