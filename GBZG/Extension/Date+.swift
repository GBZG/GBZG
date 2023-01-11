//
//  Date+.swift
//  GBZG
//
//  Created by Noah's Ark on 2023/01/11.
//

import Foundation

extension Date {
    func convertToKoreanFormat() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY년 M월 d일"
        return formatter.string(from: self)
    }
}
