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
        NavigationView {
            ScrollView {
                visitedThemeImageContainer
                visitedThemeInfoContainer
                visitedThemeLogContainer
            }
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
}

extension ThemeDetailView {
    var visitedThemeImageContainer: some View {
        Image("sampleImage")
            .resizable()
            .scaledToFill()
            .frame(width: posterSize, height:  posterSize)
            .ignoresSafeArea()
            .padding(.bottom, 24)
    }
}

extension ThemeDetailView {
    var visitedThemeInfoContainer: some View {
        VStack {
            Text("roomsA")
            //.gbzgBody2
            Text("ThemeName")
            //.gbzgLargeTitle
        }
        .padding(.bottom, 16)
    }
}

extension ThemeDetailView {
    var visitedThemeLogContainer: some View {
        VStack {
            Text("탈출")
        }
    }
}

struct ThemeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ThemeDetailView()
    }
}
