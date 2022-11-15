//
//  GBZGTabView.swift
//  GBZG
//
//  Created by KiWoong Hong on 2022/11/15.
//

import SwiftUI

struct GBZGTabView: View {
    
    @State private var tabSelection = 0
    
    var body: some View {
        TabView(selection: $tabSelection) {
            ForEach(GBZGTab.allCases, id: \.self) { tab in
                tab.view
                    .tabItem {
                        Image(tabSelection == tab.tag ? tab.enableImage : tab.disableImage)
                    }.tag(tab.tag)
            }
        }
    }
}

struct GBZGTabView_Previews: PreviewProvider {
    static var previews: some View {
        GBZGTabView()
    }
}
