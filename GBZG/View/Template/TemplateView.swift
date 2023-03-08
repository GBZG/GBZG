//
//  TempleteView.swift
//  GBZG
//
//  Created by KiWoong Hong on 2022/11/15.
//

import SwiftUI

struct TemplateView: View {
    
    let itemWidth = (UIScreen.main.bounds.size.width - 32)
    var items: [Int] = [1,2,3,4,5]
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                TemplateViewHeader
                if items.count == 0 {
                    EmptyListContainer
                } else {
                    ItemsListContainer
                }
                Spacer()
            }
            .padding(16)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
        }
        .tint(.textField)
    }
}

private extension TemplateView {
    
    // MARK: - TemplateView Header
    
    var TemplateViewHeader: some View {
        HStack {
            Text("내 템플릿")
                .gbzgLargeTitle()
            Spacer()
            NavigationLink(destination: Text("good")) {
                Image(systemName: "plus")
                    .tint(.textField)
            }
        }
        .padding(.bottom, 12)
    }
    
    var ItemsListContainer: some View {
        ScrollView(showsIndicators: false) {
            ForEach(items, id: \.self) { item in
                NavigationLink(destination: Text("\(item)")) {
                    ItemCell(title: "item.title", components: ["item.component1", "item.component2"])
                }
            }
        }
    }
    
    func ItemCell(title: String, components: [String]) -> some View {
        VStack(alignment: .leading) {
            HStack {
                Text(title)
                    .tint(.textPrimary)
                Spacer()
            }
            .padding(.top, 16)
            .padding(.bottom, 8)
            .padding(.horizontal, 16)
            
            Text(components.joined(separator: " "))
                .tint(.textSecondary)
                .padding(.horizontal, 16)
                .padding(.bottom, 16)
        }
        .frame(width: itemWidth)
        .gbzgBody2()
        .background(Color.textField)
        .cornerRadius(12)
        .padding(.bottom, 12)
    }
    
    var EmptyListContainer: some View {
        VStack {
            Spacer()
            Text("아직 저장된 템플릿이 없어요!")
                .gbzgBody2()
                .tint(.textSecondary)
            Spacer()
        }
    }
}

struct TemplateView_Previews: PreviewProvider {
    static var previews: some View {
        TemplateView()
    }
}
