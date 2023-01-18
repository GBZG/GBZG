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
                    profileInfoContainer
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

private extension HomeView {
    
    // MARK: - My Profile Info Container
    
    var profileInfoContainer: some View {
        VStack {
            HStack {
                Image(systemName: "circle")
                Text("124방")
                    .padding(.trailing, 16)
                Image(systemName: "circle")
                Text("52리뷰")
                Spacer()
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(["극쫄", "장치선호", "방탈출고수"], id: \.self) { characteristic in
                        Text("#\(characteristic)")
                            .gbzgBody2()
                            .foregroundColor(.white)
                            .padding(8)
                            .background(Color.primaryPurple)
                            .cornerRadius(12)
                    }
                }
            }
        }
        .padding(.bottom, 20)
    }

    // MARK: Room Escape Life Theme Container
    
    var lifeThemeContainer: some View {
        VStack {
            HStack {
                Text("인생테마")
                    .gbzgTitle1()
                Spacer()
                NavigationLink(destination: Text("인생테마 랭킹뷰")) {
                    Group {
                        Text("전체보기")
                        Image(systemName: "chevron.right")
                    }
                    .gbzgBody2()
                    .foregroundColor(.secondary)
                }
            }
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(Range(0...5)) { num in
                        NavigationLink(destination: Text("DetailView")) {
                            RoundedRectangle(cornerRadius: 12)
                                .frame(width: self.lifeThemeImageSize, height: self.lifeThemeImageSize * 14 / 11)
                        }
                    }
                }
            }
        }
    }

    // MARK: - Room Escape Log List Container
    
    var escapeLogListContainer: some View {
        VStack {
            HStack {
                Text("탈출일지")
                    .gbzgTitle1()
                Spacer()
            }
            .padding(.bottom, 16)
            
            HStack {
                Text("52 리뷰")
                Spacer()
                Text("최근 방문일 순")
                Image(systemName: "chevron.down")
            }
            .gbzgBody2()
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
                .gbzgHeadline()
                .tint(.primary)
                .padding(.bottom, 4)
                HStack {
                    Image(systemName: "leaf")
                    Text("지구별 방탈출 | 22.06.21")
                    Spacer()
                }
                .gbzgBody2()
                .tint(.secondary)
            }
            Spacer()
        }
        .padding(.bottom, 16)
    }
}

//struct HomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView()
//    }
//}
