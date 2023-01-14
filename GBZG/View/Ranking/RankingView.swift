//
//  RankingView.swift
//  GBZG
//
//  Created by 심명진 on 2023/01/15.
//

import SwiftUI

struct RankingView: View {
    @Environment(\.presentationMode) private var presentationMode
    var body: some View {
        
        NavigationView{
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    ForEach(1..<6){ number in
                        RankingList(rank: number, title: "테마 이름", location: "위치")
                    }
                    
                }
                .padding()
                .navigationTitle("방탈출 랭킹")
                .navigationBarItems(
                    leading: Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    },label:{
                        Image(systemName: "chevron.left")
                            .foregroundColor(.textPrimary)
                            .font(.system(size: 18))
                    }),
                    trailing: Button(action: {
                        //에딧
                    },label:{
                        Image(systemName: "pencil.circle")
                            .foregroundColor(.textPrimary)
                            .font(.system(size: 18))
                    })
                    
                    
            )
            }
            
        }
    }
}
struct RankingView_Previews: PreviewProvider {
    static var previews: some View {
        RankingView()
    }
}
