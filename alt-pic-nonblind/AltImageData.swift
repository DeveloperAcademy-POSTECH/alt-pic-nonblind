//
//  AltImage.swift
//  alt-pic-nonblind
//
//  Created by hyo on 2022/04/06.
//

import Foundation



struct AltImageData{
    let imageName: String // 이미지 이름
    let imageUrl: String // 대체텍스트 원본 url
    var altNum : Int // 대체텍스트 댓글 달린 개수
    var comments: [CommentData] // 딕셔너리로 변경하기?
}

//댓글 데이터 << 댓글 1개
struct CommentData{
    let writer: String
    let like: [String]
    let comment: String
    // 입력시간
}
//
//"드넓은 호수를 향해 뻗은 손이 하얀색 컵을 쥐고 있다.","열락의 눈에 우리 우리의 있는 우리는 그리하였는가","굳이 하지 있는 그대만이 청춘의 빛나는 법칙과 마음을 그리는 거기까지가 오고가는 군종 너의 아픔을 간직하리라","굳이 하지 있는 그대만이 청춘의 빛나는 법칙과 마음을 그리는 거기까지가 오고가는 군종 너의 아픔을 간직하리라","굳이 하지 있는 그대만이 청춘의 빛나는 법칙과 마음을 그리는 거기까지가 오고가는 군종 너의 아픔을 간직하리라"

let commentsSample = [
    CommentData(writer: "dake", like: ["hardy", "dani"], comment: "드넓은 호수를 향해 뻗은 손이 하얀색 컵을 쥐고 있다."),
    CommentData(writer: "dani", like: ["hardy", "dani"], comment: "열락의 눈에 우리 우리의 있는 우리는 그리하였는가"),
    CommentData(writer: "monica", like: ["hardy", "dani"], comment: "굳이 하지 있는 그대만이 청춘의 빛나는 법칙과 마음을 그리는 거기까지가 오고가는 군종 너의 아픔을 간직하리라"),
    CommentData(writer: "hardy", like: ["hardy", "dani"], comment: "드넓은 호수를 향해 뻗은 손이 하얀색 컵을 쥐고 있다."),
    CommentData(writer: "lance", like: ["hardy", "dani"], comment: "드넓은 호수를 향해 뻗은 손이 하얀색 컵을 쥐고 있다."),
    CommentData(writer: "leo", like: ["hardy", "dani"], comment: "드넓은 호수를 향해 뻗은 손이 하얀색 컵을 쥐고 있다."),
    CommentData(writer: "judy", like: ["hardy", "dani"], comment: "드넓은 호수를 향해 뻗은 손이 하얀색 컵을 쥐고 있다.")
]

let altImageSample = [
    AltImageData(imageName: "apple", imageUrl: "https://www.naver.com", altNum: 5, comments: [commentsSample[0], commentsSample[1], commentsSample[2]]),
    AltImageData(imageName: "avocado", imageUrl: "https://www.google.com", altNum: 20, comments: [commentsSample[3], commentsSample[4], commentsSample[5]]),
    AltImageData(imageName: "banana", imageUrl: "https://www.naver.com", altNum: 21, comments: [commentsSample[0], commentsSample[1], commentsSample[2]]),
    AltImageData(imageName: "blueberry", imageUrl: "https://www.naver.com", altNum: 3, comments: [commentsSample[0], commentsSample[1], commentsSample[2]]),
    AltImageData(imageName: "cherry", imageUrl: "https://www.naver.com", altNum: 7, comments: [commentsSample[0], commentsSample[1], commentsSample[2]]),
    AltImageData(imageName: "lemon", imageUrl: "https://www.naver.com", altNum: 3, comments: [commentsSample[0], commentsSample[1], commentsSample[2]]),
    AltImageData(imageName: "lime", imageUrl: "https://www.naver.com", altNum: 7, comments: [commentsSample[0], commentsSample[1], commentsSample[2]])
]
