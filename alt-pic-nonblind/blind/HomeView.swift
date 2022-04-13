//
//  ContentView.swift
//  alt-pic-blind
//
//  Created by 김연호 on 2022/04/05.
//

import SwiftUI
//alt-pic-blind 변수들 모아놓은 구조체
struct blind_Values {
    //접수시 링크값 및 링크값 저장할 배열
    var linkValue :String = ""
    var arr_linkValue: [String] = []
    //접수시 추가 요구사항 및 저장할 배열
    var add_linkValue :String = ""
    var arr_add_linkValues :[String] = []
    //건의사항 저장 및 저장할 배열
    var sug_value :String = ""
    var arr_sug_values : [String] = []
    //접수시간 저장할 배열
    var timedata :[String] = []
    //대체텍스트 반영이 완료 되었을때 알림이 보이거나 시간이 지난 후 보이지 않게 하기위한 변수
    var alt_pic_finish : Bool = false
}

struct ContentView: View {
    //각 네비게이션링크 마다 변수 설정을 다르게 해줘야 오류가 생기지않음
    @State var isActive_LinkView : Bool = false
    @State var isActive_SugView : Bool = false
    //각 뷰마다 바인딩 설정
    @State private var linkViewValue : blind_Values = blind_Values()
    
    var body: some View {
        NavigationView{
            ZStack{
                VStack{
                    Text("안녕하세요,").font(.system(size: 35))
                        .fontWeight(.bold)
                        .padding(.bottom, -15.0)
                    
                    Text("듣는사진 메인화면입니다.").font(.system(size:35))
                        .fontWeight(.bold)
                        .padding()
                    VStack{
                        Spacer().frame(height:50)
                        // Pop to rootview구현
                        //네비게이션 링크를 통한 화면전환 MainView -> LinkView
                        NavigationLink(destination: LinkView(linkViewValue: $linkViewValue, link_rootisActive: self.$isActive_LinkView).navigationBarHidden(false).navigationBarBackButtonHidden(false),
                            isActive: self.$isActive_LinkView
                        )
                        {
                            Text("링크 접수할게요").font(.system(size:35)).foregroundColor(.white).padding(.all, 20).background(.black).cornerRadius(8)
                        }.isDetailLink(false)
                        
                        Spacer().frame(height:40)
                        //네비게이션 링크를 통한 화면전환 MainView -> NoticeView
                        NavigationLink( destination: NoticeView(noticeValue: $linkViewValue).navigationBarHidden(false).navigationBarBackButtonHidden(false)){
                            Text("알림 확인할게요").font(.system(size:35)).foregroundColor(.white).padding(.all,20).background(.black).cornerRadius(8)}
                        
                        Spacer().frame(height:40)
                        //네비게이션 링크를 통한 화면전환 MainView -> SuggetionView
                        NavigationLink( destination: SuggestionView(SuggestionValue: $linkViewValue,sug_rootisActive: self.$isActive_SugView).navigationBarHidden(false).navigationBarBackButtonHidden(false),
                            isActive: self.$isActive_SugView
                        )
                        {
                            Text("건의사항 있어요").font(.system(size:35)).foregroundColor(.white).padding(.all,20).background(.black).cornerRadius(8)
                        }.isDetailLink(false)
                    }
                    Spacer()
                        .frame(height: 200.0)
                    }
                        
            }
            .padding(.top, 10.0)
        }
            }
    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
