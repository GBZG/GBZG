//
//  RankingView.swift
//  GBZG
//
//  Created by 심명진 on 2023/03/01.
//

import SwiftUI

struct RankingView: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject private var viewModel = RankingViewModel()
    @State private var isEditing = false

    var body: some View {
        NavigationView{
            List{
                ForEach(viewModel.rankingItems.indices, id: \.self) { index in
                    RankingRow(item: $viewModel.rankingItems[index])
                }
                .onDelete(perform: viewModel.removeTheme)
                .onMove(perform: viewModel.moveTheme)
                .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            .padding(4)
            .environment(\.editMode, .constant(self.isEditing ? EditMode.active : EditMode.inactive))
            
            .navigationTitle("인생테마 랭킹")
            .navigationBarItems(
                leading: Button(action: {
                    dismiss()
                }, label:{
                    Image(systemName: "chevron.left")
                        .foregroundColor(.textPrimary)
                        .font(.system(size: 18))
                }),
                trailing: Button(action: {
                    withAnimation(.easeInOut){
                        self.isEditing.toggle()
                    }
                }) {
                    Image(systemName: (isEditing ? "xmark" : "pencil.circle"))
                        .foregroundColor(.textPrimary)
                        .font(.system(size: 18))
                }
            )
        }
    }
}



struct RankingView_Previews: PreviewProvider {
    static var previews: some View {
        RankingView()
    }
}
