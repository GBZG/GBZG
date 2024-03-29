//
//  ThemeRow.swift
//  GBZG
//
//  Created by ICHAN NAM on 2023/01/18.
//

import SwiftUI

// TODO: 임시 Model, Integration 하면서 뺄 부분
struct TmpThemeRowModel: Identifiable {
    let id: UUID
    let title: String
    let location: String
    
    init(title: String, location: String) {
        id = UUID()
        self.title = title
        self.location = location
    }
}

struct ThemeRow: View {
    // TODO: 임시 Model, Integration 하면서 뺄 부분
    let model: TmpThemeRowModel
    let isSearchResult: Bool
    
    var body: some View {
        HStack(alignment: .top) {
            Button(action: {}) {
                HStack(spacing: 16) {
                    posterImage(url: nil)
                    textInfo(title: model.title, location: model.location)
                    Spacer()
                }
            }
            .frame(minWidth: 100, maxHeight: 104)
            Spacer()
            if !isSearchResult { // isSearchResult == false
                xmarkButton(action: {})
            }
        }
    }
}

private extension ThemeRow {
    func posterImage(url: URL?) -> some View {
        Rectangle()
            .foregroundColor(.primaryPurple)
            .frame(width: 76, height: 104)
            .cornerRadius(12)
    }
    
    func textInfo(title: String, location: String) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .foregroundColor(.textPrimary)
                .gbzgHeadline()
            HStack(spacing: 4) {
                Image("Location")
                    .resizable()
                    .frame(width: 18, height: 18)
                Text(location)
                    .gbzgBody2()
            }
            .foregroundColor(.textSecondary)
            Spacer()
        }
    }
    
    func xmarkButton(action: () -> Void) -> some View {
        Button(action: {}) {
            Image(systemName: "xmark")
                .resizable()
                .frame(width: 15.73, height: 15.73)
        }
        .foregroundColor(.textField)
        .frame(width: 24, height: 24)
    }
}

//struct RecentThemeRow_Previews: PreviewProvider {
//    static var previews: some View {
//        ThemeRow(
//            model: TmpThemeRowModel(
//                title: "단디해라",
//                location: "지구별방탈출"
//            ),
//            isSearchResult: false
//        )
//    }
//}
