//
//  CommentRowView.swift
//  alt-pic-nonblind
//
//  Created by 최동권 on 2022/04/09.
//

import SwiftUI


// 사진 + 댓글창 in List
struct CommentRowView: View {
    


    // 랜스 데이터와 합치기전 state
    //    @State var CommentDataSample : [CommentData] = [
    //        CommentData(profileImageName: "profile",profileName: "Dake", altText: "드넓은 호수를 향해 뻗은 손이 하얀색 컵을 쥐고 있다.", isliked: false, likeNum: 1),
    //        CommentData(profileImageName: "profile",profileName: "Dany", altText: "열락의 눈에 우리 우리의 있는 우리는 그리하였는가", isliked: false, likeNum: 15),
    //        CommentData(profileImageName: "profile",profileName: "Hardy", altText: "굳이 하지 있는 그대만이 청춘의 빛나는 법칙과 마음을 그리는 거기까지가 오고가는 군종 너의 아픔을 간직하리라", isliked: false, likeNum:10),
    //        CommentData(profileImageName: "profile",profileName: "Lance", altText: "굳이 하지 있는 그대만이 청춘의 빛나는 법칙과 마음을 그리는 거기까지가 오고가는 군종 너의 아픔을 간직하리라", isliked: false, likeNum:8),
    //        CommentData(profileImageName: "profile",profileName: "Monica", altText: "굳이 하지 있는 그대만이 청춘의 빛나는 법칙과 마음을 그리는 거기까지가 오고가는 군종 너의 아픔을 간직하리라", isliked: false, likeNum:5)
    //    ]
    
    //랜스의 AltImageData
//    @State var CommentDataSample = [
//        CommentData(writer: "Dake", writerProfileIamgeName: "profile", altText: "드넓은 호수를 향해 뻗은 손이 하얀색 컵을 쥐고 있다.", isLiked: false, like: ["Hardy","Dany"]),
//        CommentData(writer: "Dany", writerProfileIamgeName: "profile", altText: "열락의 눈에 우리 우리의 있는 우리는 그리하였는가", isLiked: false, like: ["Hardy","Dake"]),
//        CommentData(writer: "Lance", writerProfileIamgeName: "profile", altText: "굳이 하지 있는 그대만이 청춘의 빛나는 법칙과 마음을 그리는 거기까지가 오고가는 군종 너의 아픔을 간직하리라", isLiked: false, like: ["Hardy","Dany",]),
//        CommentData(writer: "Hardy", writerProfileIamgeName: "profile", altText: "열락의 눈에 우리 우리의 있는 우리는 그리하였는가", isLiked: false, like: ["Lance","Dake","Monica"]),
//        CommentData(writer: "Monica", writerProfileIamgeName: "profile", altText: "열락의 눈에 우리 우리의 있는 우리는 그리하였는가", isLiked: false, like: ["Hardy","Dake","Dake","Dany"])
//        //    CommentData(writer: "dake", like: ["hardy", "dani"], comment: "드넓은 호수를 향해 뻗은 손이 하얀색 컵을 쥐고 있다."),
//        //    CommentData(writer: "dani", like: ["hardy", "dani"], comment: "열락의 눈에 우리 우리의 있는 우리는 그리하였는가"),
//        //    CommentData(writer: "monica", like: ["hardy", "dani"], comment: "굳이 하지 있는 그대만이 청춘의 빛나는 법칙과 마음을 그리는 거기까지가 오고가는 군종 너의 아픔을 간직하리라"),
//        //    CommentData(writer: "hardy", like: ["hardy", "dani"], comment: "드넓은 호수를 향해 뻗은 손이 하얀색 컵을 쥐고 있다."),
//        //    CommentData(writer: "lance", like: ["hardy", "dani"], comment: "드넓은 호수를 향해 뻗은 손이 하얀색 컵을 쥐고 있다."),
//        //    CommentData(writer: "leo", like: ["hardy", "dani"], comment: "드넓은 호수를 향해 뻗은 손이 하얀색 컵을 쥐고 있다."),
//        //    CommentData(writer: "judy", like: ["hardy", "dani"], comment: "드넓은 호수를 향해 뻗은 손이 하얀색 컵을 쥐고 있다.")
//    ]
    
    
    @Binding var CommentDataSampleOrigin : [CommentData]
    
    
    @State private var showingAlert = false
    
    
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
            ForEach(CommentDataSampleOrigin.sorted(by: { $0.like.count > $1.like.count }), id:\.self){ sample in
                commentRow(comment: sample)
                    .listRowSeparator(.hidden)
                    .swipeActions(allowsFullSwipe: false) {
                        HStack {
                            if sample.writer == "Dake"{
                                Button {
                                    if let index = CommentDataSampleOrigin.firstIndex(of: sample){
                                        CommentDataSampleOrigin.remove(at: index)
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

//
//struct CommentRowView_Previews: PreviewProvider {
//    @Binding var CommentDataSample : [CommentData]
//    static var previews: some View {
//        CommentRowView()
//    }
//}
