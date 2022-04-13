//
//  CompleteView.swift
//  alt-pic-blind
//
//  Created by 김연호 on 2022/04/06.
//

import SwiftUI

struct CompleteView: View {
    @Binding var completeValue : blind_Values
    @Binding var PoptoRootView : Bool
    
    var body: some View {
        VStack{
            Text("접수가 완료되었습니다.").font(.system(size: 35))
            Spacer().frame(height: 30)
            //Pop to rootView를 통한 화면전환
            //네비게이션 링크로 화면전환을 하게되면 저장된 값들 ex)배열값 등이 초기화됨
            //아직은 좀더 공부해봐야 하지만 네비게이션 링크로 열면 새로운 네비게이션 뷰가 생성되는 것 같고 이 와 같은 방식을 사용하면 이전에 열었던 뷰로 돌아가게 됨
            Button (action: { self.PoptoRootView = false } ){
                Text("메인화면").padding(EdgeInsets(top: 20, leading: 50, bottom: 20, trailing: 50)).background(Color.black).font(.system(size: 25)).foregroundColor(.white).cornerRadius(8)
            }
        }
    }
}

//struct CompleteView_Previews: PreviewProvider {
//    static var previews: some View {
//        CompleteView()
//    }
//}
