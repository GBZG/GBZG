//
//  BasicInfoContent.swift
//  GBZG
//
//  Created by Noah's Ark on 2023/01/11.
//

import SwiftUI

struct BasicInfoContent<Content: View>: View {
    let title: String
    var isCheckboxActive: Bool
    let content: Content

    init(
        title: String,
        isCheckboxActive: Bool = true,
        @ViewBuilder content: () -> Content
    ) {
        self.title = title
        self.isCheckboxActive = isCheckboxActive
        self.content = content()
    }
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                titleView
                content
                Spacer()
            }
            checkBox
        }
    }
}

private extension BasicInfoContent {
    var titleView: some View {
        Text(title)
            .foregroundColor(.textPrimary)
            .fontWeight(.regular)
    }
    
    var checkBox: some View {
        HStack {
            Button {

            } label: {
                if isCheckboxActive {
                    Image(systemName: "checkmark.square.fill")
                        .foregroundColor(.primaryPurple)
                } else {
                    Image(systemName: "square")
                        .foregroundColor(.textField)
                }
            }
            
            Text("기억이 나지 않아요")
                .foregroundColor(.textField)
                .font(.footnote)
            
            Spacer()
        }
        .padding(.top, 10)
    }
}

//struct BasicInfoContent_Previews: PreviewProvider {
//    static var previews: some View {
//        BasicInfoContent()
//    }
//}
