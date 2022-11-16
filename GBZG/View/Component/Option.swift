//
//  Option.swift
//  GBZG
//
//  Created by ICHAN NAM on 2022/11/14.
//

import SwiftUI

struct Option: View {
    let label: String
    let action: () -> Void
    @Binding var buttonActive: Bool
    
    var body: some View {
        Button(action: {
            buttonActive.toggle()
            action()
        }) {
            Text(label)
                .padding(16.0)
                .frame(minWidth: 171.0, maxWidth: 231.0)
                .foregroundColor(Color.textSecondary)
                .background(Color.tagBase)
                .cornerRadius(12.0)
                .opacity(buttonActive ? 1.0 : 0.3)
        }
    }
}

//struct Option_Previews: PreviewProvider {
//    static var previews: some View {
//        List {
//            Option(label: "체감 난이도",
//                   action: { () -> Void in return },
//                   buttonActive: .constant(true))
//
//            Option(label: "사용 힌트 수",
//                   action: { () -> Void in return },
//                   buttonActive: .constant(false))
//        }
//    }
//}
