//
//  RecentThemeRow.swift
//  GBZG
//
//  Created by ICHAN NAM on 2023/01/18.
//

import SwiftUI

struct TmpRecentThemeRowModel: Identifiable {
    let id: UUID
    let title: String
    let location: String
    
    init(title: String, location: String) {
        id = UUID()
        self.title = title
        self.location = location
    }
}

struct RecentThemeRow: View {
    let model: TmpRecentThemeRowModel
    
    var body: some View {
        HStack(alignment: .top) {
            Button(action: {}) {
                HStack(spacing: 16) {
                    Rectangle()
                        .foregroundColor(.primaryPurple)
                        .frame(width: 76, height: 104)
                        .cornerRadius(12)
                    
                    VStack(alignment: .leading, spacing: 12) {
                        Text(model.title)
                            .foregroundColor(.textPrimary)
                            .gbzgHeadline()
                        
                        HStack(spacing: 4) {
                            Image("Location")
                                .resizable()
                                .frame(width: 18, height: 18)
                            
                            Text(model.location)
                                .gbzgBody2()
                        }
                        .foregroundColor(.textSecondary)
                        
                        Spacer()
                    }
                    
                    Spacer()
                }
            }
            .frame(minWidth: 100, maxHeight: 104)
            
            Spacer()
            
            Button(action: {}) {
                Image(systemName: "xmark")
                    .resizable()
                    .frame(width: 15.73, height: 15.73)
            }
            .foregroundColor(.textField)
            .frame(width: 24, height: 24)
        }
    }
}

//struct RecentThemeRow_Previews: PreviewProvider {
//    static var previews: some View {
//        RecentThemeRow(
//            model: TmpRecentThemeRowModel(
//                title: "단디해라",
//                location: "지구별방탈출"
//            )
//        )
//    }
//}
