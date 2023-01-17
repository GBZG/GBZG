//
//  RecentThemeList.swift
//  GBZG
//
//  Created by ICHAN NAM on 2023/01/18.
//

import SwiftUI

struct RecentThemeList: View {
    let tmpList: [TmpRecentThemeRowModel] = [
        TmpRecentThemeRowModel(title: "단디해라", location: "지구별방탈출"),
        TmpRecentThemeRowModel(title: "꿈의 공장", location: "비트포비아 서면 던전"),
        TmpRecentThemeRowModel(title: "레드룸", location: "다이아에그"),
        TmpRecentThemeRowModel(title: "꿈과 환상의 나라", location: "에버랜드"),
        TmpRecentThemeRowModel(title: "돼지국밥", location: "더이스케이프 부산")
    ]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20.0) {
                ForEach(tmpList) { row in
                    RecentThemeRow(model: row)
                }
            }
        }
    }
}

//struct RecentThemeList_Previews: PreviewProvider {
//    static var previews: some View {
//        RecentThemeList()
//    }
//}
