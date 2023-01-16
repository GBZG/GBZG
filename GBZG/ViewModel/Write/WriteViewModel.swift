//
//  WriteViewModel.swift
//  GBZG
//
//  Created by Noah's Ark on 2022/12/06.
//

import SwiftUI

@MainActor
final class WriteViewModel: ObservableObject {
    @Published var isSearchViewActive = false
    @Published var isBasicInfoContainerActive = false
    @Published var isCustomInfoContainerActive = false
    @Published var isCalendarActive = false
    
    func didTapTitleButton() {
        toggleSearchView()
    }
    
    func didTapBasicInfoButton() {
        toggleBasicInfoContainer()
    }
    
    func didTapCustomInfoButton() {
        toggleCustomInfoContainer()
    }
    
    func didCalendarTapped() {
        toggleCalendar()
    }
}

extension WriteViewModel {
    func toggleSearchView() {
        isSearchViewActive.toggle()
    }
    
    func toggleBasicInfoContainer() {
        withAnimation {
            isBasicInfoContainerActive.toggle()
        }
    }
    
    func toggleCustomInfoContainer() {
        withAnimation {
            isCustomInfoContainerActive.toggle()
        }
    }
    
    func toggleCalendar() {
        withAnimation {
            isCalendarActive.toggle()
        }
    }
}
