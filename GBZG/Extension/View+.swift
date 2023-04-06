//
//  View+.swift
//  GBZG
//
//  Created by Wonhyuk Choi on 2023/01/20.
//

import SwiftUI

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

extension View {
    
    /// 탭바 숨김 처리 여부
    /// - Parameter isHidden:
    /// - Returns:
    func setTabBarVisibility(isHidden : Bool) -> some View {
      background(TabBarAccessor { tabBar in
          print(">> TabBar height: \(tabBar.bounds.height)")
          // !! use as needed, in calculations, @State, etc.
          // 혹은 높이를 변경한다던지 여러가지 설정들이 가능하다.
          tabBar.isHidden = isHidden
      })
  }
}
