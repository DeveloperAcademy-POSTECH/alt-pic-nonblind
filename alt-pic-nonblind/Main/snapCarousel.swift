//
//  snapCarousel.swift
//  alt-pic-nonblind
//
//  Created by hyo on 2022/04/11.
//

import SwiftUI

// To for Accepting List....

// <> << 뭐지??
// Identifiable는 프로토콜이 아닌가?
struct SnapCarousel<Content: View,T: Identifiable>: View {
    // var이 어떻게 리턴을??
    // ()는 뭐지??? 튜플?
    var content: (T) -> Content
    // 왜 [T]로 하는 거지???
    var list: [T]

    // CGFloat 뭐하는 타입이지?
    var spacing: CGFloat
    var trailingSpace: CGFloat
    @Binding var index: Int


    // @ViewBuilder
    // @escaping
    init(spacing: CGFloat = 15,trailingSpace: CGFloat = 100,index: Binding<Int>,items: [T],@ViewBuilder content: @escaping (T)->Content){

        self.list = items
        self.spacing = spacing
        self.trailingSpace = trailingSpace
        self._index = index
        self.content = content
    }

    // Offset...
    @GestureState var offset: CGFloat = 0
    @State var currentIndex: Int = 0

    var body: some View{

        GeometryReader{proxy in

            // Setting correct Width for snap Carousel....

            // One Sided Snap Caorusel...

            let width = proxy.size.width - (trailingSpace - spacing)
            let adjustMentWidth = (trailingSpace / 2) - spacing

            let dragGesture = DragGesture()
                .updating($offset, body: { value, out, _ in

                    out = value.translation.width
                })
                .onEnded({ value in

                    // Updating Current Index....
                    let offsetX = value.translation.width

                    // were going to convert the tranlsation into progress (0 - 1)
                    // and round the value...
                    // based on the progress increasing or decreasing the currentIndex...

                    let progress = -offsetX / width

                    let roundIndex = progress.rounded()

                    // setting min...
                    currentIndex = max(min(currentIndex + Int(roundIndex), list.count - 1), 0)

                    // updating index....
                    currentIndex = index
                })
                .onChanged({ value in
                    // updating only index....

                    // Updating Current Index....
                    let offsetX = value.translation.width

                    // were going to convert the tranlsation into progress (0 - 1)
                    // and round the value...
                    // based on the progress increasing or decreasing the currentIndex...

                    let progress = -offsetX / width

                    let roundIndex = progress.rounded()

                    // setting min...
                    index = max(min(currentIndex + Int(roundIndex), list.count - 1), 0)
                })
            
            HStack(spacing: spacing){

                ForEach(list){item in

                    content(item)
                        .frame(width: proxy.size.width - trailingSpace)
                }
            }
            // Spacing will be horizontal padding...
            .padding(.horizontal,spacing)
            // setting only after 0th index..
            .offset(x: (CGFloat(currentIndex) * -width) + (currentIndex != 0 ? adjustMentWidth : 0) + offset)
            .highPriorityGesture(dragGesture)
        }
        // Animatiing when offset = 0
        .animation(.easeInOut, value: offset == 0)
    }
}

