//
//  GBZGTabView.swift
//  GBZG
//
//  Created by KiWoong Hong on 2022/11/15.
//

import SwiftUI

struct GBZGTabView: View {
    var body: some View {
        TabView {
            ForEach(GBZGTab.allCases, id: \.self) { tab in
                tab.view
                    .tabItem {
                        
                        // TODO: 추후에 이미지나 시스템 이미지 맞는 걸로 변경
                        
                        Label(tab.tabName, systemImage: tab.systemImage)
                    }
            }
        }
    }
}

struct GBZGTabView_Previews: PreviewProvider {
    static var previews: some View {
        GBZGTabView()
    }
}
