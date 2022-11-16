//
//  TagButton.swift
//  GBZG
//
//  Created by Wonhyuk Choi on 2022/11/17.
//

import SwiftUI

struct TagButton: View {
    let label: String
    let backgroudColor: Color = .tagBase
    let action: () -> Void
    
    var body: some View {
        Button {
            
        } label: {
            Text(label)
                .font(.system(size: 15, weight: .light))
                .foregroundColor(.secondary)
                .padding(.horizontal, 12)
                .padding(.vertical, 8)
                .background(backgroudColor)
                .cornerRadius(12)
        }
    }
}
