//
//  TagButton.swift
//  GBZG
//
//  Created by Wonhyuk Choi on 2022/11/17.
//

import SwiftUI

struct TagButton: View {
    let label: String
    let isActive: Bool
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(label)
                .lineLimit(1)
                .fixedSize(horizontal: true, vertical: true)
                .font(.system(size: 15, weight: .light))
                .foregroundColor(isActive ? .background : .secondary)
                .padding(.horizontal, 12)
                .padding(.vertical, 8)
                .background(isActive ? Color.primaryPurple : Color.tagBase)
                .cornerRadius(12)
        }
    }
}

//struct TagButton_Previews: PreviewProvider {
//    static var previews: some View {
//        VStack {
//            TagButton(label: "Text", action: {
//                
//            }, isActive: .constant(false))
//            TagButton(label: "Text", action: {
//                
//            }, isActive: .constant(true))
//        }
//        .previewLayout(.sizeThatFits)
//    }
//}
