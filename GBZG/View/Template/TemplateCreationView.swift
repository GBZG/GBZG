//
//  TemplateCreationView.swift
//  GBZG
//
//  Created by KiWoong Hong on 2023/04/17.
//

import SwiftUI

struct Component: Hashable {
    var name: String
    var isChecked: Bool = false
    var listNumber: Int = 0
}

struct TemplateCreationView: View {
    
    @State var text = ""
    @State var allComponents: [Component] = [
        Component(name: "대충"),
        Component(name: "템플릿의"),
        Component(name: "구성"),
        Component(name: "요소"),
        Component(name: "이름입니다"),
        Component(name: "하하"),
        Component(name: "호호"),
        Component(name: "쿄쿄"),
        Component(name: "후후")
    ]
    
    var body: some View {
        VStack {
            TemplateCreationViewHeader
            TemplateNameEditContainer
            TemplateComponentsEditContainer
            AddOptionButton
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
        .padding(.bottom, 16)
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
        .padding(.bottom, 36)
    }
    
    var TemplateComponentsEditContainer: some View {
        VStack {
            HStack {
                Text("구성 요소")
                    .gbzgSubtitle()
                Spacer()
            }
            .padding(.bottom, 16)
            ForEach($allComponents, id: \.self) { $component in
                TemplateComponentsItem($component)
            }
        }
    }
    
    func TemplateComponentsItem(_ item: Binding<Component>) -> some View {
        HStack {
            Image(systemName: item.isChecked.wrappedValue ? "\(item.listNumber.wrappedValue).square.fill" : "square")
                .foregroundColor(item.isChecked.wrappedValue ? .purple030 : .black)
                .onTapGesture {
                    item.isChecked.wrappedValue.toggle()
                    if item.isChecked.wrappedValue {
                        item.listNumber.wrappedValue = allComponents.filter({ $0.isChecked }).count
                    } else {
                        allComponents.enumerated().forEach { (index, component) in
                            if component.listNumber > item.listNumber.wrappedValue {
                                allComponents[index].listNumber -= 1
                            }
                        }
                    }
                }
            Text(item.name.wrappedValue)
            Spacer()
        }
        .gbzgBody1()
        .padding(.bottom, 16)
    }
    
    var AddOptionButton: some View {
        Button(action: {
        }, label: {
            HStack {
                Image(systemName: "plus")
                Text("옵션 추가")
                Spacer()
            }
            .foregroundColor(.textPrimary)
        })
    }
}

struct TemplateCreationView_Previews: PreviewProvider {
    static var previews: some View {
        TemplateCreationView()
    }
}
