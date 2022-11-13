//
//  GbzgButton.swift
//  GBZG
//
//  Created by ICHAN NAM on 2022/11/13.
//

import SwiftUI

struct GbzgButton: View {
    let label: String
    let action: () -> Void
    @Binding var disabled: Bool
    
    var body: some View {
        Button(action: action) {
            HStack {
                Text(label)
                    .font(.system(size: 15.0, weight: .regular))
            }
            .padding(.vertical, 13.0)
            .frame(width: 350.0)
            .foregroundColor(disabled ? .textField : .background)
            .background(disabled ? Color.buttonDisabled : Color.primaryPurple)
            .cornerRadius(12)
        }
        .disabled(disabled)
    }
}

struct GbzgButton_Previews: PreviewProvider {
    static var previews: some View {
        List {
            GbzgButton(label: "이 템플릿으로 리뷰 작성",
                       action: { () -> Void in return },
                       disabled: .constant(false))
            
            GbzgButton(label: "완료",
                       action: { () -> Void in return },
                       disabled: .constant(true))
        }
    }
}
