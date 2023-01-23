//
//  SearchResultList.swift
//  GBZG
//
//  Created by ICHAN NAM on 2023/01/18.
//

import SwiftUI

struct SearchResultList: View {
    @Binding var searchKeyword: String
    
    // TODO: 임시 데이터 리스트, Integration 하면서 뺄 부분 - 최근검색기록이 있는 경우
    let tmpList: [TmpThemeRowModel] = [
        TmpThemeRowModel(title: "Do Dandi", location: "지구별방탈출"),
        TmpThemeRowModel(title: "Dream Factory", location: "비트포비아 서면 던전"),
        TmpThemeRowModel(title: "Red Room", location: "다이아에그"),
        TmpThemeRowModel(title: "Everland", location: "에버랜드"),
        TmpThemeRowModel(title: "Korean Pork Soup", location: "더이스케이프 부산")
    ]
    
    // TODO: 임시 데이터 리스트, Integration 하면서 뺄 부분 - 최근검색기록이 없는 경우
    // let tmpList: [TmpRecentThemeRowModel] = []
    
    var body: some View {
        VStack(alignment: .trailing) {
            if searchKeyword.count == 0 {
                HStack {
                    Text("최근 검색 테마")
                        .gbzgSubtitle()
                    Spacer()
                }
                .padding(EdgeInsets(top: 8, leading: 0, bottom: 4, trailing: 0))
            }
            
            ScrollView {
                if searchKeyword.count > 0 {
                    SearchList
                } else {
                    if tmpList.count > 0 {
                        NotEmptyRecentList
                    } else {
                        EmptyRecentList
                    }
                }
            }
        }
    }
}

private extension SearchResultList {
    var SearchList: some View {
        VStack(spacing: 20) {
            ForEach(tmpList.filter{$0.title.contains(searchKeyword)}) { row in
                ThemeRow(
                    model: row,
                    isSearchResult: true
                )
            }
        }
    }
    
    var EmptyRecentList: some View {
        HStack {
            Text("검색된 테마가 없습니다.")
                .multilineTextAlignment(.leading)
                .gbzgBody1()
                .foregroundColor(.textSecondary)
            Spacer()
        }
    }
    
    var NotEmptyRecentList: some View {
        VStack(spacing: 20) {
            ForEach(tmpList) { row in
                ThemeRow(
                    model: row,
                    isSearchResult: false
                )
            }
        }
    }
}

//struct RecentThemeList_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchResultList()
//    }
//}
