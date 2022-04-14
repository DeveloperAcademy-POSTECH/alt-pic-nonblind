//
//  SuggestionView.swift
//  alt-pic-blind
//
//  Created by 김연호 on 2022/04/06.
//

import SwiftUI

struct SuggestionView: View {
    @State var navigatevalue : Bool = false
    @FocusState var isInputActive : Bool
    @Binding var SuggestionValue : blind_Values
    @Binding var sug_rootisActive : Bool
    var body: some View {
        VStack{
            Text("건의사항 접수하기").font(.system(size: 45))
            
            Spacer().frame(height: 70)
            
            Text("건의사항을 아래 적어주세요.").font(.system(size: 27))
            Text("음성 녹음, 글자 입력").font(.system(size: 27))
            Text("모두 가능합니다!").font(.system(size: 27))
            
            Spacer().frame(height: 40)
            
            HStack{
                //제안 사항을 텍스트에디터에 추가
                TextEditor(text: $SuggestionValue.sug_value).frame(width:325, height:250).colorMultiply(Color(white: 0.87)).foregroundColor(Color.black).font(.system(size: 20)).focused($isInputActive).toolbar {
                    ToolbarItemGroup(placement: .keyboard){
                        Spacer()
                        
                        Button("Done") {
                            isInputActive = false
                        }
                    }
                
                }            }
            Spacer().frame(height:70)
            //네비게이션 링크의 올바른 작성법?
            NavigationLink {
                CompleteView(completeValue: $SuggestionValue, PoptoRootView: self.$sug_rootisActive).simultaneousGesture(TapGesture().onEnded({ () in
                    SuggestionValue.arr_sug_values.append(SuggestionValue.sug_value)
                    print(SuggestionValue.arr_sug_values[0])
                }))
            } label: {
                Text("접수하기").font(.system(size:35)).foregroundColor(.white).padding(EdgeInsets(top: 20, leading: 50, bottom: 20, trailing: 50)).background(.black).cornerRadius(8)
                    
            }.isDetailLink(false)


            
            Spacer().frame(height:50)
        }
    }

}
//접수 완료 창으로 넘어감과 동시에 텍스트 에디터의 값이 배열로 삽입
//            NavigationLink( destination:CompleteView(completeValue: $SuggestionValue, PoptoRootView: self.$sug_rootisActive))
//            {
//                Text("접수하기").font(.system(size:35)).foregroundColor(.white).padding(EdgeInsets(top: 20, leading: 50, bottom: 20, trailing: 50)).background(.black).cornerRadius(8).simultaneousGesture(TapGesture().onEnded{
//                    SuggestionValue.arr_sug_values.append(SuggestionValue.sug_value)
//                    print("Sug_working")
//                })
//
//            }.isDetailLink(false)

//struct SuggestionView_Previews: PreviewProvider {
//    static var previews: some View {
//        SuggestionView()
//    }
//}
