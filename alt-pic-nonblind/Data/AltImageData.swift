//
//  AltImage.swift
//  alt-pic-nonblind
//
//  Created by hyo on 2022/04/06.
//

import Foundation



struct AltImageData: Identifiable{
    let id = UUID().uuidString
    let imageName: String // 이미지 이름
    let imageUrl: String // 대체텍스트 원본 url
    var altNum : Int // 대체텍스트 댓글 달린 개수
    var imageComments : [CommentData] // 딕셔너리로 변경하기?
}

//댓글 데이터 << 댓글 1개
struct CommentData : Hashable{
    var writer: String //작성자 이름
    var writerProfileIamgeName: String //작성자 프로필 사진 이름
    var altText: String // 댓글
    var isLiked: Bool // 좋아요 눌렀는지 여부
    var like: [String] //like 명단
    //    var likeNum: Int // like 갯수
    //    let comment: String
    // 입력시간
}
//
//"드넓은 호수를 향해 뻗은 손이 하얀색 컵을 쥐고 있다.","열락의 눈에 우리 우리의 있는 우리는 그리하였는가","굳이 하지 있는 그대만이 청춘의 빛나는 법칙과 마음을 그리는 거기까지가 오고가는 군종 너의 아픔을 간직하리라","굳이 하지 있는 그대만이 청춘의 빛나는 법칙과 마음을 그리는 거기까지가 오고가는 군종 너의 아픔을 간직하리라","굳이 하지 있는 그대만이 청춘의 빛나는 법칙과 마음을 그리는 거기까지가 오고가는 군종 너의 아픔을 간직하리라"
// 수정후
var CommentDataSample = [
    CommentData(writer: "Dake", writerProfileIamgeName: "bisil", altText: "드넓은 호수를 향해 뻗은 손이 하얀색 컵을 쥐고 있다.", isLiked: false, like: ["Hardy","Dany"]),
    CommentData(writer: "Dany", writerProfileIamgeName: "profileTest", altText: "열락의 눈에 우리 우리의 있는 우리는 그리하였는가", isLiked: false, like: ["Hardy","Dake"]),
    CommentData(writer: "Lance", writerProfileIamgeName: "toong", altText: "굳이 하지 있는 그대만이 청춘의 빛나는 법칙과 마음을 그리는 거기까지가 오고가는 군종 너의 아픔을 간직하리라", isLiked: false, like: ["Hardy","Dany",]),
    CommentData(writer: "Hardy", writerProfileIamgeName: "jingu", altText: "열락의 눈에 우리 우리의 있는 우리는 그리하였는가", isLiked: false, like: ["Lance","Dake","Monica"]),
    CommentData(writer: "Monica", writerProfileIamgeName: "dora", altText: "열락의 눈에 우리 우리의 있는 우리는 그리하였는가", isLiked: false, like: ["Hardy","Dake","Dake","Dany"])
]

//수정전 데이터
//var altImageSample = [
//    AltImageData(imageName: "apple", imageUrl: "https://www.naver.com", altNum: 5,imageComments: CommentDataSample),
//    AltImageData(imageName: "avocado", imageUrl: "https://www.google.com", altNum: 20,imageComments: CommentDataSample),
//    AltImageData(imageName: "banana", imageUrl: "https://www.naver.com", altNum: 21,imageComments: CommentDataSample),
//    AltImageData(imageName: "blueberry", imageUrl: "https://www.naver.com", altNum: 3,imageComments: CommentDataSample),
//    AltImageData(imageName: "cherry", imageUrl: "https://www.naver.com", altNum: 7,imageComments: CommentDataSample),
//    AltImageData(imageName: "lemon", imageUrl: "https://www.naver.com", altNum: 3,imageComments: CommentDataSample),
//    AltImageData(imageName: "lime", imageUrl: "https://www.naver.com", altNum: 7,imageComments: CommentDataSample)
//]


// 수정 전
//let commentsSample = [
//    CommentData(writer: "dake", like: ["hardy", "dani"], comment: "드넓은 호수를 향해 뻗은 손이 하얀색 컵을 쥐고 있다."),
//    CommentData(writer: "dani", like: ["hardy", "dani"], comment: "열락의 눈에 우리 우리의 있는 우리는 그리하였는가"),
//    CommentData(writer: "monica", like: ["hardy", "dani"], comment: "굳이 하지 있는 그대만이 청춘의 빛나는 법칙과 마음을 그리는 거기까지가 오고가는 군종 너의 아픔을 간직하리라"),
//    CommentData(writer: "hardy", like: ["hardy", "dani"], comment: "드넓은 호수를 향해 뻗은 손이 하얀색 컵을 쥐고 있다."),
//    CommentData(writer: "lance", like: ["hardy", "dani"], comment: "드넓은 호수를 향해 뻗은 손이 하얀색 컵을 쥐고 있다."),
//    CommentData(writer: "leo", like: ["hardy", "dani"], comment: "드넓은 호수를 향해 뻗은 손이 하얀색 컵을 쥐고 있다."),
//    CommentData(writer: "judy", like: ["hardy", "dani"], comment: "드넓은 호수를 향해 뻗은 손이 하얀색 컵을 쥐고 있다.")
//]

//let altImageSample = [
//    AltImageData(imageName: "apple", imageUrl: "https://www.naver.com", altNum: 5, imageComments: CommentDataSample),
//    AltImageData(imageName: "avocado", imageUrl: "https://www.google.com", altNum: 20, imageComments: CommentDataSample),
//    AltImageData(imageName: "banana", imageUrl: "https://www.naver.com", altNum: 21, imageComments: CommentDataSample),
//    AltImageData(imageName: "blueberry", imageUrl: "https://www.naver.com", altNum: 3, imageComments: CommentDataSample),
//    AltImageData(imageName: "cherry", imageUrl: "https://www.naver.com", altNum: 7, imageComments: CommentDataSample),
//    AltImageData(imageName: "lemon", imageUrl: "https://www.naver.com", altNum: 3, imageComments: CommentDataSample),
//    AltImageData(imageName: "lime", imageUrl: "https://www.naver.com", altNum: 7, imageComments:CommentDataSample),
//    AltImageData(imageName: "musinsa", imageUrl: "https://www.naver.com", altNum: 8, imageComments: CommentDataSample)
//
//]
