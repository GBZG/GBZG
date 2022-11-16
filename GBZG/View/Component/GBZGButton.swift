//
//  GBZGButton.swift
//  GBZG
//
//  Created by ICHAN NAM on 2022/11/13.
//

import SwiftUI

struct GBZGButton: View {
    let label: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(label)
                .font(.system(size: 15.0, weight: .regular))
                .padding(.vertical, 13.0)
                .frame(minWidth: 300.0, idealWidth: 350.0, maxWidth: 400.0)
                .foregroundColor(.background)
                .background(Color.primaryPurple)
                .cornerRadius(12)
        }
    }
}

//struct GBZGButton_Previews: PreviewProvider {
//    static var previews: some View {
//        List {
//            GBZGButton(label: "이 템플릿으로 리뷰 작성",
//                       action: {})
//        }
//    }
//}
