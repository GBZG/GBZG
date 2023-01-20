//
//  ThemeDetailView.swift
//  GBZG
//
//  Created by KiWoong Hong on 2023/01/18.
//

import SwiftUI

struct ThemeDetailView: View {
    let posterSize = UIScreen.main.bounds.size.width
    
    var body: some View {
        VStack {
            ScrollView(showsIndicators: false) {
                visitedThemeImageContainer
                visitedThemeInfoContainer
                    .padding(.horizontal, 16)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .toolbar {
            ToolbarItem {
                NavigationLink(destination: Text("WriteView")) {
                    Image("Pencil")
                }
            }
        }
        .ignoresSafeArea()
    }
}

extension ThemeDetailView {
    
    // MARK: - visited Theme Image Poster
    
    var visitedThemeImageContainer: some View {
        Image("sampleImage")
            .resizable()
            .scaledToFill()
            .frame(width: posterSize, height:  posterSize)
            .ignoresSafeArea()
            .padding(.bottom, 24)
    }
    
    // MARK: - visited theme info container
    
    var visitedThemeInfoContainer: some View {
        VStack {
            locationComponent
            themeNameComponent
            visitInfoBoxComponent
            //            themeGradeComponent
            //            escapeSuccessComponent
            //            fearLevelComoponent
            //            numberOfhintsUsedComponent
            //            visitedThemeLogComponent
        }
        .padding(.bottom, 16)
    }
    
    var locationComponent: some View {
        HStack {
            Image(systemName: "leaf")
            Text("roomsA")
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .gbzgBody2()
        .foregroundColor(.textSecondary)
    }
    
    var themeNameComponent: some View {
        Text("ThemeName")
            .gbzgLargeTitle()
            .foregroundColor(.textPrimary)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    var visitInfoBoxComponent: some View {
        VStack {
            HStack {
                Image(systemName: "leaf")
                Text("2022.05.25")
                Spacer()
            }
            .padding(.all, 16)
            HStack {
                Image(systemName: "leaf")
                Text("테오, 테오, 테오, 테오")
                Spacer()
            }
            .padding([.bottom, .leading, .trailing], 16)
        }
        .gbzgBody1()
        .foregroundColor(.textSecondary)
        .background(Color.tagBase)
        .cornerRadius(12)
        .padding(.bottom, 16)
    }
}

// MARK: - ThemeDetailView common component

private struct componentTitle: View {
    
    let title: String
    
    var body: some View {
        HStack {
            Text(title)
            Spacer()
        }
        .gbzgBody1()
        .foregroundColor(.textPrimary)
        .padding(.bottom, 12)
    }
}

//struct ThemeDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        ThemeDetailView()
//    }
//}
