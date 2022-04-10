//
//  heartVIew.swift
//  alt-pic-nonblind
//
//  Created by 최동권 on 2022/04/09.
//

import SwiftUI

struct heartVIew: View {
    var Image1 : String = "heart"
    var body: some View {
        List{
            ForEach(0..<3){ index in
                HStack{
                    Button(action: {
                        print("button is tapped")
                    },label: {
                        Image(systemName: Image1)
                    }).buttonStyle(.plain)
                        
                }
                
            }
        }
        .listStyle(.plain)
    }
}

struct heartVIew_Previews: PreviewProvider {
    static var previews: some View {
        heartVIew()
    }
}
