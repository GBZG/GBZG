//
//  SearchBar.swift
//  GBZG
//
//  Created by ICHAN NAM on 2023/01/17.
//

import SwiftUI

struct SearchBar: View {
    @State private var text = ""
    
    var body: some View {
        HStack(spacing: 8) {
            Image("Magnifyingglass")
                .resizable()
                .frame(width: 20, height: 20)
            
            TextField("기록하고 싶은 테마를 검색하세요", text: $text)
                .gbzgBody2()
            
            Spacer()
        }
        .foregroundColor(.textSecondary)
        .padding(12)
        .background(Color.tagBase)
        .cornerRadius(12)
    }
}

//struct SearchBar_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchBar()
//    }
//}
