//
//  RankingList.swift
//  GBZG
//
//  Created by 심명진 on 2023/01/15.
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
                .font(.system(size: 20, weight: .semibold))
                .foregroundColor(.textPrimary)
            
            // 이미지
            Rectangle()
                .fill(Color.primaryPurple)
                .frame(width: 72, height: 72)
                .cornerRadius(12)
            
            // 테마 정보
            VStack(alignment: .leading, spacing: 4){
                Text(title)
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(.textPrimary)
                HStack(spacing: 4){
                    Image(systemName: "paperplane.fill")
                        .font(.system(size: 15, weight: .regular))
                        .foregroundColor(.textSecondary)
                    Text(location)
                        .font(.system(size: 15, weight: .regular))
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
