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
        case .home      : return "Home"
        case .write     : return "Write"
        case .template  : return "Template"
        }
    }
    
    // TODO: 추후에 활성 아이콘 추가시 변경 예정
    
    var enableImage: String {
        switch self {
        case .home      : return "EllipsisVertical"
        case .write     : return "EllipsisVertical"
        case .template  : return "EllipsisVertical"
        }
    }
    
    var disableImage: String {
        switch self {
        case .home      : return "HotelKeys"
        case .write     : return "Pencil"
        case .template  : return "TextBlock"
        }
    }
    
    var tag: Int {
        switch self {
        case .home      : return 0
        case .write     : return 1
        case .template  : return 2
        }
    }
 
    @ViewBuilder
    var view: some View {
        switch self {
        case .home      : HomeView()
        case .write     : WriteView()
        case .template  : TemplateView()
        }
    }
}
