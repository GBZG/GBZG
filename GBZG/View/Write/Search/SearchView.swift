//
//  SearchView.swift
//  GBZG
//
//  Created by ICHAN NAM on 2023/01/17.
//

import SwiftUI

struct SearchView: View {
    var body: some View {
        VStack(spacing: 16.0) {
            Text("테마 검색")
                .font(.system(size: 20.0, weight: .semibold))
            
            SearchBar()
            
            HStack {
                Text("최근 검색 테마")
                    .font(.system(size: 15.0, weight: .bold))
                
                Spacer()
            }
            .padding(EdgeInsets(top: 8.0, leading: 0.0, bottom: 4.0, trailing: 0.0))
            
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
