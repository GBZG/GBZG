//
//  OptionContainer.swift
//  GBZG
//
//  Created by Wonhyuk Choi on 2023/01/11.
//

import SwiftUI

enum ContainerMode {
    case close
    case open
}

enum ContentMode {
    case none
    case optionMode
    case templateMode
}

struct OptionContainer: View {
    @Binding var containerMode: ContainerMode
    @Binding var contentMode: ContentMode
    @State var showSheet: Bool = false
    
    var body: some View {
        VStack {
            topButtonRow
            if containerMode == .open {
                VStack {
                    Divider()
                        .background(Color.tagBase)
                    contentView
                }
                .transition(.move(edge: .bottom))
            }
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .overlay(Rectangle().frame(width: nil, height: 1, alignment: .top).foregroundColor(.tagBase), alignment: .top)
        .background(Color.background)
        .offset(y: calculateOffset())
        .animation(.spring(), value: containerMode)
        .edgesIgnoringSafeArea(.all)
        .sheet(isPresented: $showSheet) {
            UserCustomReviewView()
        }
    }
    
    // 상단 버튼열 뷰
    private var topButtonRow: some View {
        HStack(spacing: 32) {
            Button {
                containerMode = .open
                contentMode = .optionMode
            } label: {
                Image(systemName: "plus.viewfinder")
            }
            .foregroundColor(contentMode == .optionMode ? .primaryPurple : .secondary)
            Button {
                // TODO: 이미지 불러오기
            } label: {
                Image("Images")
            }
            Button {
                containerMode = .open
                contentMode = .templateMode
            } label: {
                Image("TextBlock")
            }
            .foregroundColor(contentMode == .templateMode ? .primaryPurple : .secondary)
            Spacer()
        }
        .foregroundColor(.secondary)
        .padding(.horizontal, 23)
        .padding(.vertical, 16)
    }
}
 
private extension OptionContainer {
    // 내용 뷰
    var contentView: some View {
        ZStack {
            switch contentMode {
            case .none:
                EmptyView()
            case .optionMode:
                optionView
            case .templateMode:
                VStack {
                    Text("Template View")
                    Spacer()
                }// TODO: 템플릿뷰로 교체
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 24)
    }
    
    // 옵션 뷰
    // TODO: 뷰모델과 연결해서 로직 추가 해야 함
    var optionView: some View {
        VStack(spacing: 16) {
            HStack(spacing: 16) {
                Option(label: "체감 난이도", action: {
                    
                }, buttonActive: .constant(true))
                Option(label: "사용 힌트 수", action: {
                    
                }, buttonActive: .constant(true))
            }
            HStack(spacing: 16) {
                Option(label: "테마 성공 여부", action: {
                    
                }, buttonActive: .constant(true))
                Option(label: "평점", action: {
                    
                }, buttonActive: .constant(true))
            }
            HStack(spacing: 16) {
                Option(label: "활동성", action: {
                    
                }, buttonActive: .constant(true))
                Option(label: "공포도", action: {
                    
                }, buttonActive: .constant(true))
            }
            HStack(spacing: 16) {
                Option(label: "기록", action: {
                    
                }, buttonActive: .constant(true))
                Option(label: "직접 입력", action: {
                    showSheet = true
                }, buttonActive: .constant(true))
            }
            Spacer()
        }
    }
    
    // 오프셋 계산 함수
    // TODO: 뷰모델 혹은 추후 generic 하게 전역함수로 변경
    func calculateOffset() -> CGFloat {
        switch containerMode {
        case .close:
            return UIScreen.main.bounds.height - 90
        case .open:
            return UIScreen.main.bounds.height - 394
        }
    }
}

//struct OptionContainer_Previews: PreviewProvider {
//    static var previews: some View {
//        OptionContainer(containerMode: .constant(.close), contentMode: .constant(.none))
//    }
//}
