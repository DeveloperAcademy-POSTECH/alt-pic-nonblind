//
//  CommentRowView.swift
//  alt-pic-nonblind
//
//  Created by 최동권 on 2022/04/09.
//

import SwiftUI

struct CommentRowView: View {
    
    @State private var showingAlert = false
    
    var body: some View {
        List{
            ForEach(0..<5){ index in
                commentRow(comment: CommentDataSample[index])
                    .alert(isPresented: $showingAlert) {
                                            Alert(title: Text("해당 텍스트를 신고하시겠습니까?"), primaryButton: .destructive(Text("신고"), action: {
                                                // Some action
                                            }), secondaryButton: .cancel(Text("취소")))
                                        }
            }
           
//            VStack{
//                ForEach(0..<5){ index in
//                    commentRow(comment: CommentDataSample[index])
//                }.alert(isPresented: $showingAlert) {
//                    Alert(title: Text("해당 텍스트를 신고하시겠습니까?"), primaryButton: .destructive(Text("신고"), action: {
//                        // Some action
//                    }), secondaryButton: .cancel(Text("취소")))
//                }
//            }
        }.listStyle(.plain)
    }
}

struct commentRow : View{
    @State private var showingAlert = false
    
    let comment : CommentData
    
    var body: some View {
        HStack{
            VStack {
                Spacer()
                Image(comment.profileImageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
                    .background(.gray)
                    .clipShape(Circle())
                Text(comment.profileName)
                Spacer()
            }
            VStack(alignment:.leading) {
                Text(comment.altText)
                HStack {
                    Button(action: {
                        self.comment.isliked.toggle()
                    }){
                        Image(systemName: comment.isliked == true ? "heart.fill" : "heart")
                            .foregroundColor(.red)
                            .frame(width: 10, height: 10)
                            .padding(.leading)
                    }
                    .buttonStyle(.plain)
                    Text("\(comment.likeNum)")
                    Spacer()
                }
            }
        }
        .listRowSeparator(.hidden)
        .swipeActions {
            HStack {
                Button {
                    print("text deleted")
                } label: {
                    Label("Delete", systemImage: "trash")
                }.tint(.red)
                
                Button {
                    self.showingAlert = true
                    print(showingAlert)
                } label: {
                    Label("Report", systemImage: "bell.fill")
                }
                .tint(.gray)
            }
        }
    }
}


struct CommentRowView_Previews: PreviewProvider {
    static var previews: some View {
        CommentRowView()
    }
}
