//
//  SearchView.swift
//  GBZG
//
//  Created by ICHAN NAM on 2023/01/17.
//

import SwiftUI

struct SearchView: View {
    @State private var searchKeyword = ""
    
    var body: some View {
        VStack(spacing: 16) {
            Text("테마 검색")
                .gbzgHeadline()
            SearchBar(text: $searchKeyword)
            SearchResultList(searchKeyword: $searchKeyword)
        }
        .foregroundColor(.textPrimary)
    }
}

//struct SearchView_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchView()
//    }
//}
