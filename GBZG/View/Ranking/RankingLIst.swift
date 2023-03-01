//
//  RankingLIst.swift
//  GBZG
//
//  Created by 심명진 on 2023/03/01.
//

import SwiftUI

struct RankingList: View {
    let rank: Int
    let title: String
    let location: String
    
    
    var body: some View {
        
        HStack(spacing: 16){
            // 랭킹
            Text(String(rank))
                .gbzgHeadline()
                .foregroundColor(.textPrimary)

            // 이미지
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.primaryPurple)
                .frame(width: 72, height: 72)

            // 테마 정보
            VStack(alignment: .leading, spacing: 4){
                Text(title)
                    .gbzgHeadline()
                    .foregroundColor(.textPrimary)
                HStack(spacing: 4){
                    Image(systemName: "paperplane.fill")
                        .gbzgBody2()
                        .foregroundColor(.textSecondary)
                    Text(location)
                        .gbzgBody2()
                        .foregroundColor(.textSecondary)
                }
            
            }
            Spacer()
        }
    }
}

//struct RankingList_Previews: PreviewProvider {
//    static var previews: some View {
//        RankingList()
//    }
//}
