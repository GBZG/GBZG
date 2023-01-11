//
//  HomeView.swift
//  GBZG
//
//  Created by KiWoong Hong on 2022/11/15.
//

import SwiftUI

struct HomeView: View {
    
    let lifeThemeImageSize = (UIScreen.main.bounds.size.width - 32 - 36 - 56) / 3
    let escapeLogItemImageSize = (UIScreen.main.bounds.size.width - 32) / 5
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                ScrollView(showsIndicators: false) {
                    myCharacterContainer
                    lifeThemeContainer
                    escapeLogListContainer
                }
            }
            .padding(16)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            .navigationTitle("롬희의 방탈출")
            .toolbar {
                ToolbarItem {
                    NavigationLink(destination: Text("good")) {
                        Image(systemName: "gearshape.fill")
                            .tint(.textField)
                    }
                }
            }
        }
    }
}

extension HomeView {
    var myCharacterContainer: some View {
        VStack {
            Text("124방")
        }
    }
}

extension HomeView {
    var lifeThemeContainer: some View {
        VStack {
            HStack {
                Text("인생테마")
                    .GBZGTitle1()
                Spacer()
                Group {
                    Text("전체보기")
                    Image(systemName: "chevron.right")
                }
                .GBZGBody2()
                .foregroundColor(.secondary)
            }
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(Range(0...5)) { num in
                        RoundedRectangle(cornerRadius: 12)
                            .frame(width: self.lifeThemeImageSize, height: self.lifeThemeImageSize * 14 / 11)
                    }
                }
            }
        }
    }
}

extension HomeView {
    var escapeLogListContainer: some View {
        VStack {
            HStack {
                Text("탈출일지")
                    .GBZGTitle1()
                Spacer()
            }
            .padding(.bottom, 16)
            
            HStack {
                Text("52 리뷰")
                Spacer()
                Text("최근 방문일 순")
                Image(systemName: "chevron.down")
            }
            .GBZGBody2()
            .foregroundColor(.secondary)
            .padding(.horizontal, 7)
            .padding(.bottom, 16)
            
            VStack {
                ForEach(Range(0...5)) { num in
                    NavigationLink(destination: Text("DetailView")) {
                        escapeLogCell
                    }
                }
            }
        }
    }
    
    var escapeLogCell: some View {
        HStack {
            Image("Bin")
                .resizable()
                .frame(width: escapeLogItemImageSize, height: escapeLogItemImageSize)
                .padding(.trailing, 16)
            VStack {
                HStack {
                    Text("단디해라")
                    Image(systemName: "leaf")
                    Spacer()
                }
                .GBZGHeadline()
                .tint(.primary)
                .padding(.bottom, 4)
                HStack {
                    Image(systemName: "leaf")
                    Text("지구별 방탈출 | 22.06.21")
                    Spacer()
                }
                .GBZGBody2()
                .tint(.secondary)
            }
            Spacer()
        }
        .padding(.bottom, 16)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
