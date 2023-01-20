//
//  ThemeDetailView.swift
//  GBZG
//
//  Created by KiWoong Hong on 2023/01/18.
//

import SwiftUI

struct ThemeDetailView: View {
    let posterSize = UIScreen.main.bounds.size.width
    
    let point = 3.5
    
    var body: some View {
        VStack {
            ScrollView(showsIndicators: false) {
                visitedThemeImageContainer
                visitedThemeInfoContainer
                    .padding(.horizontal, 16)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .toolbar {
            ToolbarItem {
                NavigationLink(destination: Text("WriteView")) {
                    Image("Pencil")
                }
            }
        }
        .ignoresSafeArea()
    }
}

extension ThemeDetailView {
    
    // MARK: - visited Theme Image Poster
    
    var visitedThemeImageContainer: some View {
        Image("sampleImage")
            .resizable()
            .scaledToFill()
            .frame(width: posterSize, height:  posterSize)
            .ignoresSafeArea()
            .padding(.bottom, 24)
    }
    
    // MARK: - visited theme info container
    
    var visitedThemeInfoContainer: some View {
        VStack {
            locationComponent
            themeNameComponent
            visitInfoBoxComponent
            themeGradeComponent
            escapeSuccessComponent
            fearLevelComoponent
            numberOfhintsUsedComponent
            visitedThemeLogComponent
        }
        .padding(.bottom, 16)
    }
    
    var locationComponent: some View {
        HStack {
            Image(systemName: "leaf")
            Text("roomsA")
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .gbzgBody2()
        .foregroundColor(.textSecondary)
    }
    
    var themeNameComponent: some View {
        Text("ThemeName")
            .gbzgLargeTitle()
            .foregroundColor(.textPrimary)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    var visitInfoBoxComponent: some View {
        VStack {
            HStack {
                Image(systemName: "leaf")
                Text("2022.05.25")
                Spacer()
            }
            .padding(.all, 16)
            HStack {
                Image(systemName: "leaf")
                Text("테오, 테오, 테오, 테오")
                Spacer()
            }
            .padding([.bottom, .leading, .trailing], 16)
        }
        .gbzgBody1()
        .foregroundColor(.textSecondary)
        .background(Color.tagBase)
        .cornerRadius(12)
        .padding(.bottom, 16)
    }
    
    var themeGradeComponent: some View {
        VStack {
            componentTitle(title: "평점")
            HStack {
                ForEach(["흙길", "풀길", "꽃길", "인생테마"], id: \.self) { text in
                    componentLabel(text: text, selected: text == "인생테마" ? true : false)
                }
                Spacer()
            }
        }
        .padding(.bottom, 24)
    }
    
    var escapeSuccessComponent: some View {
        VStack {
            componentTitle(title: "탈출 성공 여부")
            HStack {
                ForEach(["탈출 성공", "탈출 실패"], id: \.self) { text in
                    componentLabel(text: text, selected: text == "탈출 성공" ? true : false)
                }
                Spacer()
            }
        }
        .padding(.bottom, 24)
    }
    
    var fearLevelComoponent: some View {
        VStack {
            componentTitle(title: "공포도")
            HStack {
                ForEach(1...5, id: \.self) { star in
                    if Double(star) > point && Double(star - 1) < point {
                        Image(systemName: "star.leadinghalf.filled")
                            .foregroundColor(.primaryPurple)
                    } else {
                        Image(systemName: point < Double(star) ? "star" : "star.fill")
                            .foregroundColor(.primaryPurple)
                    }
                }
                Spacer()
            }
        }
        .padding(.bottom, 24)
    }
    
    var numberOfhintsUsedComponent: some View {
        VStack {
            componentTitle(title: "사용 힌트 수")
            HStack {
                Text("3개")
                    .gbzgBody2()
                    .foregroundColor(.textSecondary)
                Spacer()
            }
        }
        .padding(.bottom, 24)
    }
    
    var visitedThemeLogComponent: some View {
        VStack {
            componentTitle(title: "방탈출 탈출일지")
            Text("탈출일지 내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용")
                .gbzgBody2()
                .foregroundColor(.textField)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                .padding(.bottom, 24)
        }
    }
}

// MARK: - ThemeDetailView common component

private struct componentTitle: View {
    
    let title: String
    
    var body: some View {
        HStack {
            Text(title)
            Spacer()
        }
        .gbzgBody1()
        .foregroundColor(.textPrimary)
        .padding(.bottom, 12)
    }
}

private struct componentLabel: View {
    
    let text: String
    let selected: Bool
    var body: some View {
        Text(text)
            .gbzgBody2()
            .foregroundColor(selected ? .background : .textSecondary)
            .padding(8)
            .background(selected ? Color.primaryPurple : Color.tagBase)
            .cornerRadius(12)
    }
}

//struct ThemeDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        ThemeDetailView()
//    }
//}
