//
//  CommentData.swift
//  alt-pic-nonblind
//
//  Created by 최동권 on 2022/04/09.
//

import Foundation
import SwiftUI

struct CommentData:Hashable{
    var profileImageName: String //프로필 사진
    var profileName: String // 프로필 이름
    var altText: String // 댓글
    var isliked: Bool
    var likeNum: Int
}

//var CommentDataSample = [
//    CommentData(profileImageName: "profile",profileName: "Dake", altText: "드넓은 호수를 향해 뻗은 손이 하얀색 컵을 쥐고 있다.", isliked: false, likeNum: 18),
//    CommentData(profileImageName: "profile",profileName: "Dany", altText: "열락의 눈에 우리 우리의 있는 우리는 그리하였는가", isliked: false, likeNum: 15),
//    CommentData(profileImageName: "profile",profileName: "Hardy", altText: "굳이 하지 있는 그대만이 청춘의 빛나는 법칙과 마음을 그리는 거기까지가 오고가는 군종 너의 아픔을 간직하리라", isliked: false, likeNum:10),
//    CommentData(profileImageName: "profile",profileName: "Lance", altText: "굳이 하지 있는 그대만이 청춘의 빛나는 법칙과 마음을 그리는 거기까지가 오고가는 군종 너의 아픔을 간직하리라", isliked: false, likeNum:8),
//    CommentData(profileImageName: "profile",profileName: "Monica", altText: "굳이 하지 있는 그대만이 청춘의 빛나는 법칙과 마음을 그리는 거기까지가 오고가는 군종 너의 아픔을 간직하리라", isliked: false, likeNum:5)
//]
