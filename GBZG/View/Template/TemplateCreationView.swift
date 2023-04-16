//
//  TemplateCreationView.swift
//  GBZG
//
//  Created by KiWoong Hong on 2023/04/17.
//

import SwiftUI

struct TemplateCreationView: View {
    @State var text = ""
    var body: some View {
        VStack {
            TemplateCreationViewHeader
            TemplateNameEditContainer
            Spacer()
        }
        .padding(16)
    }
}

extension TemplateCreationView {
    var TemplateCreationViewHeader: some View {
        HStack {
            Text("템플릿 만들기")
                .gbzgLargeTitle()
            Spacer()
        }
        .padding(.bottom, 12)
    }
    
    var TemplateNameEditContainer: some View {
        VStack {
            HStack {
                TextField("", text: $text, prompt: Text("템플릿 이름을 입력해주세요."))
                    .foregroundColor(.textSecondary)
                Spacer()
                if text != "" {
                    Image(systemName: "clear.fill")
                        .foregroundColor(.textSecondary)
                        .onTapGesture {
                            text = ""
                        }
                }
            }
            .foregroundColor(.purple030)
            .frame(minHeight: 20)
            .padding(.bottom, 4)
            Rectangle()
                .frame(height: 0.8)
                .foregroundColor(text == "" ? .textPrimary : .purple030)
        }
    }
    
    var TemplateComponentsEditContainer: some View {
        Text("hi")
        // TemplateComponentItem:
        /*
        ScrollView(showsIndicators: false) {
            ForEach(items, id: \.self) { item in
                NavigationLink(destination: Text("\(item)")) {
                    ItemCell(title: "item.title", components: ["item.component1", "item.component2"])
                        .padding(.bottom, 12)
                }
            }
        }
         */
    }
    
}

struct TemplateCreationView_Previews: PreviewProvider {
    static var previews: some View {
        TemplateCreationView()
    }
}
