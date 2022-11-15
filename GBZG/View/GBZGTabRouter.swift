//
//  TabRouter.swift
//  GBZG
//
//  Created by KiWoong Hong on 2022/11/15.
//

import SwiftUI

enum GBZGTab: CaseIterable {
    case home
    case write
    case template
    
    var tabName: String {
        switch self {
        case .home : return "Home"
        case .write: return "Write"
        case .template: return "Template"
        }
    }
    
    // TODO: 추후에 선정 아이콘에 맞는 이미지나 시스템이미지로 변경
    
    var systemImage: String {
        switch self {
        case .home : return "key.fill"
        case .write: return "folder.fill"
        case .template: return "person.crop.circle.fill"
        }
    }
    
    var disableImage: String {
        switch self {
        case .home : return "HotelKeys"
        case .write: return "Pencil"
        case .template: return "TextBlock"
        }
    }
 
    @ViewBuilder
    var view: some View {
        switch self {
        case .home : HomeView()
        case .write: WriteView()
        case .template: TemplateView()
        }
    }
}
