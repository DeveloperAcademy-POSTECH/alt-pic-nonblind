//
//  CommentRowView.swift
//  alt-pic-nonblind
//
//  Created by 최동권 on 2022/04/09.
//

import SwiftUI


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


struct CommentRowView_Previews: PreviewProvider {
    static var previews: some View {
        CommentRowView(altImageCommentElementComment: .constant([
            CommentData(writer: "Dake", writerProfileIamgeName: "bisil", altText: "드넓은 호수를 향해 뻗은 손이 하얀색 컵을 쥐고 있다.", isLiked: false, like: ["Hardy","Dany"]),
            CommentData(writer: "Dany", writerProfileIamgeName: "profileTest", altText: "열락의 눈에 우리 우리의 있는 우리는 그리하였는가", isLiked: false, like: ["Hardy","Dake"]),
            CommentData(writer: "Lance", writerProfileIamgeName: "toong", altText: "굳이 하지 있는 그대만이 청춘의 빛나는 법칙과 마음을 그리는 거기까지가 오고가는 군종 너의 아픔을 간직하리라", isLiked: false, like: ["Hardy","Dany",]),
            CommentData(writer: "Hardy", writerProfileIamgeName: "jingu", altText: "열락의 눈에 우리 우리의 있는 우리는 그리하였는가", isLiked: false, like: ["Lance","Dake","Monica"]),
            CommentData(writer: "Monica", writerProfileIamgeName: "dora", altText: "열락의 눈에 우리 우리의 있는 우리는 그리하였는가", isLiked: false, like: ["Hardy","Dake","Dake","Dany"])
        ]))
    }
}
