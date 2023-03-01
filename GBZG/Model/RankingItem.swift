//
//  RankingItem.swift
//  GBZG
//
//  Created by 심명진 on 2023/03/01.
//
import SwiftUI

struct RankingItem: Identifiable {
    let id = UUID()
    var rank: Int
    var title: String
    var location: String
    var date: String
}
