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
