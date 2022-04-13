//
//  NoticeView.swift
//  alt-pic-blind
//
//  Created by 김연호 on 2022/04/06.
//

import SwiftUI

private var linkViewValue : blind_Values = blind_Values()

struct noticeValues : Identifiable {
    let id  = UUID()
    var accept_time : String
    var accept_explain : String
}

struct NoticeView: View {
    @Binding var noticeValue : blind_Values
    var body: some View {
        VStack{
            Text("알림").font(.system(size: 45)).padding()
            Divider().padding().frame(height: 3).background(.black)
            
            //스크롤 뷰를 통한 알림 리스트 작성
            ScrollView(){
                VStack {//현재 시간이 저장된 배열의 인자 수 만큼 반복을 함
                    ForEach(0..<noticeValue.timedata.count){ num in
                        Text("\(noticeValue.timedata[num])" + "에 접수하신 수정사항이 반영되었습니다.").font(.system(size: 24)).padding()
                    Divider().frame(height: 1).background(Color(white: 0.87))
                    }.frame(maxWidth: .infinity)
                }
            }
        }
                    
    }
}

    


//struct NoticeView_Previews: PreviewProvider {
//    static var previews: some View {
//        NoticeView()
//        noticevalue(){
//            self.accept_time = accept_time
//            self.accept_explain = accept_explain
//       }
//    }
//}
