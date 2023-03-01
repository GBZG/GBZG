//
//  RankingLIst.swift
//  GBZG
//
//  Created by 심명진 on 2023/03/01.
//
import SwiftUI

struct RankingRow: View {
    @Binding var item: RankingItem

    var body: some View {
        HStack(spacing: 16) {
            // 랭킹
            Text(String(item.rank))
                .font(.headline)
                .foregroundColor(.primary)

            // 이미지
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.primaryPurple)
                .frame(width: 72, height: 90)

            // 테마 정보
            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Text(item.title)
                        .font(.headline)
                        .foregroundColor(.primary)
                    Image(systemName: "leaf.fill")
                        .font(.title)
                        .foregroundColor(.secondary)
                }
                HStack(spacing: 4) {
                    Image(systemName: "paperplane.fill")
                        .font(.body)
                        .foregroundColor(.secondary)
                    Text(item.location)
                        .font(.body)
                        .foregroundColor(.secondary)
                    Text("|")
                        .font(.body)
                        .foregroundColor(.secondary)
                    Text(item.date)
                        .font(.body)
                        .foregroundColor(.secondary)
                }
            }
            Spacer()
        }
    }
}




//struct RankingRow_Previews: PreviewProvider {
//    static var previews: some View {
//        RankingRow()
//    }
//}
