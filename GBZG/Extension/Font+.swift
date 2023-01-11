//
//  Font+.swift
//  GBZG
//
//  Created by KiWoong Hong on 2023/01/11.
//

import SwiftUI

extension Font {
    static var GBZGLargeTitle = Font.system(size: 28, weight: .heavy)
    static var GBZGTitle1 = Font.system(size: 24, weight: .bold)
    static var GBZGTitle2 = Font.system(size: 22, weight: .regular)
    static var GBZGHeadline = Font.system(size: 20, weight: .semibold)
    static var GBZGBody1 = Font.system(size: 17, weight: .regular)
    static var GBZGBody2 = Font.system(size: 15, weight: .regular)
    static var GBZGSubtitle = Font.system(size: 15, weight: .bold)
    static var GBZGFootnote = Font.system(size: 13, weight: .regular)
}

extension View {
    func GBZGLargeTitle() -> some View {
        self.font(.GBZGLargeTitle)
    }
    
    func GBZGTitle1() -> some View {
        self.font(.GBZGTitle1)
    }
    
    func GBZGTitle2() -> some View {
        self.font(.GBZGTitle2)
    }
    
    func GBZGHeadline() -> some View {
        self.font(.GBZGHeadline)
    }
    
    func GBZGBody1() -> some View {
        self.font(.GBZGBody1)
    }
    
    func GBZGBody2() -> some View {
        self.font(.GBZGBody2)
    }
    
    func GBZGSubtitle() -> some View {
        self.font(.GBZGSubtitle)
    }
    
    func GBZGFootnote() -> some View {
        self.font(.GBZGFootnote)
    }
}
