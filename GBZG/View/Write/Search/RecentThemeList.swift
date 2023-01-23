//
//  RecentThemeList.swift
//  GBZG
//
//  Created by ICHAN NAM on 2023/01/18.
//

import SwiftUI

struct RecentThemeList: View {
    // TODO: 임시 데이터 리스트, Integration 하면서 뺄 부분 - 최근검색기록이 있는 경우
    let tmpList: [TmpRecentThemeRowModel] = [
        TmpRecentThemeRowModel(title: "단디해라", location: "지구별방탈출"),
        TmpRecentThemeRowModel(title: "꿈의 공장", location: "비트포비아 서면 던전"),
        TmpRecentThemeRowModel(title: "레드룸", location: "다이아에그"),
        TmpRecentThemeRowModel(title: "꿈과 환상의 나라", location: "에버랜드"),
        TmpRecentThemeRowModel(title: "돼지국밥", location: "더이스케이프 부산")
    ]
    
    // TODO: 임시 데이터 리스트, Integration 하면서 뺄 부분 - 최근검색기록이 없는 경우
    // let tmpList: [TmpRecentThemeRowModel] = []
    
    var body: some View {
        VStack(alignment: .trailing) {
            HStack {
                Text("최근 검색 테마")
                    .gbzgSubtitle()
                Spacer()
            }
            .padding(EdgeInsets(top: 8, leading: 0, bottom: 4, trailing: 0))
            
            ScrollView {
                if tmpList.count > 0 {
                    NotEmptyRecentList
                } else {
                    EmptyRecentList
                }
            }
        }
    }
}

private extension RecentThemeList {
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
                RecentThemeRow(model: row)
            }
        }
    }
}

//struct RecentThemeList_Previews: PreviewProvider {
//    static var previews: some View {
//        RecentThemeList()
//    }
//}
