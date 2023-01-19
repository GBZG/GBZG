//
//  SearchView.swift
//  GBZG
//
//  Created by ICHAN NAM on 2023/01/17.
//

import SwiftUI

struct SearchView: View {
    var body: some View {
        VStack(spacing: 16) {
            Text("테마 검색")
                .gbzgHeadline()
            
            SearchBar()
            
            HStack {
                Text("최근 검색 테마")
                    .gbzgSubtitle()
                
                Spacer()
            }
            .padding(EdgeInsets(top: 8, leading: 0, bottom: 4, trailing: 0))
            
            RecentThemeList()
        }
        .foregroundColor(.textPrimary)
    }
}

//struct SearchView_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchView()
//    }
//}
