//
//  HomeView.swift
//  GBZG
//
//  Created by KiWoong Hong on 2022/11/15.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            //ScrollView {
            VStack(alignment: .leading) {
                ScrollView {
                    myCharacterContainer
                    lifeThemeContainer
                    escapeLogContainer
                }
            }
            .padding(16)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                .navigationTitle("롬희의 방탈출")
                .toolbar {
                    ToolbarItem {
                        NavigationLink(destination: Text("good")) {
                            Image(systemName: "gearshape.fill")
                                .tint(.textField)
                        }
                    }
                }
        }
    }
    
    var myCharacterContainer: some View {
        VStack {
            Text("124방")
        }
    }
    
    var lifeThemeContainer: some View {
        VStack {
            Text("인생테마")
        }
    }

    var escapeLogContainer: some View {
        VStack {
            Text("탈출일지")
        }
    }
}

//struct HomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView()
//    }
//}
