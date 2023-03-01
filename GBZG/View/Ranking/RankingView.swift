//
//  RankingView.swift
//  GBZG
//
//  Created by 심명진 on 2023/03/01.
//

import SwiftUI

struct Theme: Identifiable {
    var id = UUID()
    var index: Int
    var title: String
    var location: String
}

let themesData: [Theme] = [
    Theme(index: 1,
          title: "단디해라",
          location: "대구1호점"),
    Theme(index: 2,
          title: "테오공주의 방",
          location: "대구대구"),
    Theme(index: 3,
          title: "명탐정혀키",
          location: "가보자고"),
    Theme(index: 4,
          title: "티모요정의 대모험",
          location: "티모왕국")

]

struct RankingView: View {
    @Environment(\.presentationMode) private var presentationMode

    @State private var themes: [Theme] = themesData
    @State var isEditing = false

    
    var body: some View {
        NavigationView{
            List{
                ForEach(themes) { theme in
                    RankingRow(rank: theme.index, title: theme.title, location: theme.location)
                }
                .onDelete(perform: removeList)
                .onMove(perform: moveList)
                .listRowSeparator(.hidden)
                
            }
            .listStyle(.plain)
            .padding(4)
            
            // Edit Mode
            .environment(\.editMode, .constant(self.isEditing ? EditMode.active : EditMode.inactive))
            
            // Navigation Bar
            .navigationTitle("인생테마 랭킹")
            .navigationBarItems(
                leading: Button(action: {
                    presentationMode.wrappedValue.dismiss()
                },label:{
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
            )//: NavBarItems
        }
    }
    
    //MARK: - 함수
    func removeList(at offsets: IndexSet) {
        themes.remove(atOffsets: offsets)
    }
    
    func moveList(from source: IndexSet, to destination: Int) {
        themes.move(fromOffsets: source, toOffset: destination)
    }
    
}

struct RankingView_Previews: PreviewProvider {
    static var previews: some View {
        RankingView()
    }
}
