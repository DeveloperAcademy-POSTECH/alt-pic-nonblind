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
}


let altImageSample = [
    AltImageData(imageName: "apple", imageUrl: "https://www.naver.com", altNum: 5),
    AltImageData(imageName: "avocado", imageUrl: "https://www.google.com", altNum: 20),
    AltImageData(imageName: "banana", imageUrl: "https://www.naver.com", altNum: 21),
    AltImageData(imageName: "blueberry", imageUrl: "https://www.naver.com", altNum: 3),
    AltImageData(imageName: "cherry", imageUrl: "https://www.naver.com", altNum: 7),
    AltImageData(imageName: "lemon", imageUrl: "https://www.naver.com", altNum: 3),
    AltImageData(imageName: "lime", imageUrl: "https://www.naver.com", altNum: 7)
]
