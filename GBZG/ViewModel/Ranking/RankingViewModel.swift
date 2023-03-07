//
//  RankingViewModel.swift
//  GBZG
//
//  Created by 심명진 on 2023/03/01.
//

import Foundation
import SwiftUI

class RankingViewModel: ObservableObject {
    @Published var rankingItems: [RankingItem] = [
        RankingItem(rank: 1, title: "단디해라", location: "대구1호점", date: "23.09.10"),
        RankingItem(rank: 2, title: "테오공주의 방", location: "대구대구", date: "23.09.10"),
        RankingItem(rank: 3, title: "명탐정혀키", location: "가보자고", date: "23.09.10"),
        RankingItem(rank: 3, title: "티모요정의 대모험", location: "티모왕국", date: "23.09.10")
    ]
        
    func removeTheme(at offsets: IndexSet) {
        rankingItems.remove(atOffsets: offsets)
        updateRankingItems()
    }
    
    func moveTheme(from source: IndexSet, to destination: Int) {
        rankingItems.move(fromOffsets: source, toOffset: destination)
        updateRankingItems()
    }
    
    private func updateRankingItems() {
        // rankingItems를 위치에 따라 정렬
        rankingItems.sort(by: { $0.location < $1.location })
        
        // 랭킹을 위치에 따라 업데이트
        var currentRank = 0
        var previousLocation = ""
        rankingItems.indices.forEach { i in
            let item = rankingItems[i]
            if item.location != previousLocation {
                currentRank += 1
                previousLocation = item.location
            }
            rankingItems[i].rank = currentRank
        }
    }
}
