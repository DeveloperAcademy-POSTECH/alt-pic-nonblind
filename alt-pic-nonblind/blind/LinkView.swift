//
//  LinkView.swift
//  alt-pic-blind
//
//  Created by 김연호 on 2022/04/06.
//
import Foundation
import SwiftUI

struct LinkView: View {
    
    //Date 타입인 현재 날짜를 원하는 형식과 String 타입으로 변환해주는 메소드
    @State var Str_curDate : String = ""
    @State var dateFormatter = DateFormatter()
    func createFormatter(dateValue: Date) -> String {
        dateFormatter.dateFormat = "YYYY년 MM월 dd일 HH:mm:ss"
        Str_curDate = dateFormatter.string(from: dateValue)
        return Str_curDate
    }
    
    @FocusState var isInputActive: Bool
    @State private var isempty : Bool = true
    @Binding var linkViewValue : blind_Values
    @Binding var link_rootisActive : Bool
    
    var body: some View {
        VStack {
            VStack{
                    Text("링크 접수하기").font(.system(size: 35))
                    
                    Text("링크를 아래에 붙여주세요!").padding(.all ,10)
                    
                    HStack{
                        Spacer().frame(width: 40)
                        
                        TextField("", text: $linkViewValue.linkValue).frame(width:325).background(Color(white:0.87)).focused($isInputActive)
                            .toolbar {
                            ToolbarItemGroup(placement: .keyboard){
                                Spacer()
                                
                                Button("Done") {
                                    isInputActive = false
                                }
                            }
                        
                        }
                        
                        Spacer().frame(width: 40)
                
                    }
                    Spacer().frame(height: 50)
                    Text("링크에 대한 추가 설명은").padding(.all, 2).font(.system(size: 25))
                    Text("아래에 적어주세요. (선택)").font(.system(size: 25))
                    HStack{
                        Spacer().frame(width:40)
                        
                        TextEditor(text: $linkViewValue.add_linkValue).frame(width:325, height:250).colorMultiply(Color(white: 0.87)).foregroundColor(Color.black).font(.system(size: 20)).focused($isInputActive)
                        
                        Spacer().frame(width:40)
                    }
                    //네비게이션 링크 버튼 이벤트 까지 생성
                    //접수하기 버튼을 누르면 2022년 4월 11일 15:24와 같은 형식으로 변환된 현재시간이 문자열 타입으로 배열에 순차정렬하게 됨
                NavigationLink( destination: CompleteView(completeValue: $linkViewValue,PoptoRootView: self.$link_rootisActive).navigationBarHidden(false).navigationBarBackButtonHidden(false))
                    {
                        Text("접수하기").font(.system(size:35)).foregroundColor(.white).padding(EdgeInsets(top: 20, leading: 50, bottom: 20, trailing: 50)).background(.black).cornerRadius(8)
                    }.isDetailLink(false).simultaneousGesture(TapGesture().onEnded{
                            //네비게이션 링크를 클릭시 각 배열에 시간, 링크값, 추가요구사항을 삽입
                            linkViewValue.timedata.append(createFormatter(dateValue: Date()));
                            linkViewValue.arr_linkValue.append(linkViewValue.linkValue);
                            linkViewValue.arr_add_linkValues.append(linkViewValue.add_linkValue)
                            print("-----------")
                            print(linkViewValue.arr_linkValue[0])
                            print("-----------")
                            print(linkViewValue.arr_add_linkValues[0])
                        })
                Spacer().frame(height: 100)
                }

     }
  }
}

//struct LinkView_Previews: PreviewProvider {
//    static var previews: some View {
//        LinkView()
//    }
//}


