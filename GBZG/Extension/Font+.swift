//
//  Font+.swift
//  GBZG
//
//  Created by KiWoong Hong on 2023/01/11.
//

import SwiftUI

extension Font {
    static var gbzgLargeTitle = Font.system(size: 28, weight: .heavy)
    static var gbzgTitle1 = Font.system(size: 24, weight: .bold)
    static var gbzgTitle2 = Font.system(size: 22, weight: .regular)
    static var gbzgHeadline = Font.system(size: 20, weight: .semibold)
    static var gbzgBody1 = Font.system(size: 17, weight: .regular)
    static var gbzgBody2 = Font.system(size: 15, weight: .regular)
    static var gbzgSubtitle = Font.system(size: 15, weight: .bold)
    static var gbzgFootnote = Font.system(size: 13, weight: .regular)
}

extension View {
    func gbzgLargeTitle() -> some View {
        self.font(.gbzgLargeTitle)
    }
    
    func gbzgTitle1() -> some View {
        self.font(.gbzgTitle1)
    }
    
    func gbzgTitle2() -> some View {
        self.font(.gbzgTitle2)
    }
    
    func gbzgHeadline() -> some View {
        self.font(.gbzgHeadline)
    }
    
    func gbzgBody1() -> some View {
        self.font(.gbzgBody1)
    }
    
    func gbzgBody2() -> some View {
        self.font(.gbzgBody2)
    }
    
    func gbzgSubtitle() -> some View {
        self.font(.gbzgSubtitle)
    }
    
    func gbzgFootnote() -> some View {
        self.font(.gbzgFootnote)
    }
}
