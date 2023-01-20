//
//  UserCustomReviewView.swift
//  GBZG
//
//  Created by Wonhyuk Choi on 2023/01/14.
//

import SwiftUI

struct UserCustomReviewView: View {
    enum ContentMode: Equatable {
        case none
        case starRating
        case choice
        case subjective
        case descriptive
    }
    
    @State var title: String = ""
    @State var contentMode: ContentMode = .none
    @State var choiceOptions = ["", ""]
    @State var contentHeight = CGFloat.zero
    
    @ObservedObject private var keyboard = KeyboardResponder()
    
    var body: some View {
        ZStack {
            Color.background
            VStack {
                Capsule()
                        .fill(Color.secondary)
                        .frame(width: 30, height: 3)
                        .padding(10)
                ScrollView(showsIndicators: false) {
                    sheetTitle
                    previewContainer
                    inputContainer
                }
                .padding(.bottom, keyboard.currentHeight + 35)
                .animation(.spring(), value: keyboard.currentHeight)
            }
            .ignoresSafeArea(.keyboard)
            VStack {
                Spacer()
                GBZGButton(label: "완료") {

                }
                .padding(.horizontal, 20)
                .padding(.bottom, 24)
            }
        }
        .onTapGesture {
            self.hideKeyboard()
        }
    }
}

private extension UserCustomReviewView {
    var sheetTitle: some View {
        Text("직접 입력")
            .font(.headline) // TODO: 디자인 시스템 폰트 추가시 변경
            .foregroundColor(.textPrimary)
    }
    
    var previewContainer: some View {
        VStack(spacing: 12) {
            HStack {
                Text("미리보기")
                    .font(.subheadline) // TODO: 디자인 시스템 폰트 추가시 변경
                Spacer()
            }
            contentContainer
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 32)
    }
    
    var contentContainer: some View {
        VStack{
            HStack {
                Text(title != "" ? title : "타이틀")
                    .font(.body) // TODO: 디자인 시스템 폰트 추가시 변경
                    .foregroundColor(.textPrimary)
                Spacer()
                Button {
                    
                } label: {
                    Image(systemName: "xmark.app")
                        .font(.system(size: 20, weight: .medium))
                        .foregroundColor(.textField)
                }
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 25)
            previewContent
            Spacer()
        }
        .frame(height: 140 + contentHeight)
        .foregroundColor(.white)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.tagBase, lineWidth: 1)
        )
    }
    
    var previewContent: some View {
        HStack {
            switch contentMode {
            case .none:
                EmptyView()
            case .starRating:
                HStack(spacing: 8) {
                    ForEach(1..<6) { index in
                        Image("Star")
                            .foregroundColor(.tagBase)
                    }
                }
            case .choice:
                choiceContent
            case .subjective:
                Text("최대 24자까지 작성 가능합니다.")
                    .font(.body) // TODO: 디자인 시스템 폰트 추가시 변경
                    .foregroundColor(.textField)
            case .descriptive:
                Text("최대 500자까지 작성 가능합니다.")
                    .font(.body) // TODO: 디자인 시스템 폰트 추가시 변경
                    .foregroundColor(.textField)
            }
            Spacer()
        }
        .padding(.horizontal, 16)
    }
    
    var choiceContent: some View {
        var width = CGFloat.zero
        var height = CGFloat.zero
        
        return GeometryReader { geometry in
            ZStack(alignment: .topLeading) {
                ForEach(Array(choiceOptions.enumerated()), id: \.0) { idx, option in
                    TagButton(label: option != "" ? "\(option)" : "옵션 \(idx+1)", isActive: false) {}
                        .padding([.trailing, .bottom], 8)
                        .alignmentGuide(.leading, computeValue: { d in
                            if (abs(width - d.width) > geometry.size.width)
                            {
                                width = 0
                                height -= d.height
                            }
                            let result = width
                            if idx == choiceOptions.count-1 {
                                width = 0 //last item
                            } else {
                                width -= d.width
                            }
                            return result
                        })
                        .alignmentGuide(.top, computeValue: {d in
                            let result = height
                            if idx == choiceOptions.count-1 {
                                height = 0 // last item
                            }
                            return result
                        })
                }
            }.background(viewHeightReader($contentHeight))
        }
    }
    
    var inputContainer: some View {
        VStack {
            VStack(spacing: 20) {
                HStack {
                    Text("직접 입력")
                        .font(.subheadline) // TODO: 디자인 시스템 폰트 추가시 변경
                    Spacer()
                }
                VStack {
                    TextField("타이틀을 입력해주세요 (최대 15자)", text: $title)
                        .limitTextLength($title, to: 15)
                        .font(.body) // TODO: 디자인 시스템 폰트 추가시 변경
                        .tint(.textPrimary)
                    Divider()
                        .background(Color.tagBase)
                }
                HStack(spacing: 12) {
                    TagButton(
                        label: "별점",
                        isActive: contentMode == .starRating) {
                            if contentMode != .starRating {
                                contentMode = .starRating
                                contentHeight = 0
                            }
                        }
                    TagButton(
                        label: "객관식",
                        isActive: contentMode == .choice) {
                            if contentMode != .choice {
                                contentMode = .choice
                                choiceOptions = ["", ""]
                                contentHeight = 0
                            }
                        }
                    TagButton(
                        label: "주관식",
                        isActive: contentMode == .subjective) {
                            if contentMode != .subjective {
                                contentMode = .subjective
                                contentHeight = 0
                            }
                        }
                    TagButton(
                        label: "서술형",
                        isActive: contentMode == .descriptive) {
                            if contentMode != .descriptive {
                                contentMode = .descriptive
                                contentHeight = 0
                            }
                        }
                    Spacer()
                }
                if case .choice = contentMode {
                    VStack(spacing: 24) {
                        VStack {
                            HStack {
                                TextField("옵션 1", text: $choiceOptions[0])
                                    .limitTextLength($choiceOptions[0], to: 20)
                                    .font(.body) // TODO: 디자인 시스템 폰트 추가시 변경
                                    .tint(.textPrimary)
                                if choiceOptions[0] != "" {
                                    Button {
                                        choiceOptions[0] = ""
                                    } label: {
                                        Image(systemName: "xmark")
                                            .foregroundColor(.textPrimary)
                                            .frame(height: 18)
                                    }
                                }
                            }
                            Divider()
                                .background(Color.tagBase)
                        }
                        VStack {
                            HStack {
                                TextField("옵션 2", text: $choiceOptions[1])
                                    .limitTextLength($choiceOptions[1], to: 20)
                                    .font(.body) // TODO: 디자인 시스템 폰트 추가시 변경
                                    .tint(.textPrimary)
                                if choiceOptions[1] != "" {
                                    Button {
                                        choiceOptions[1] = ""
                                    } label: {
                                        Image(systemName: "xmark")
                                            .foregroundColor(.textPrimary)
                                            .frame(height: 18)
                                    }
                                }
                            }
                            Divider()
                                .background(Color.tagBase)
                        }
                        VStack {
                            if choiceOptions.count == 3 {
                                HStack {
                                    TextField("옵션 3", text: $choiceOptions[2])
                                        .limitTextLength($choiceOptions[2], to: 20)
                                        .font(.body) // TODO: 디자인 시스템 폰트 추가시 변경
                                        .tint(.textPrimary)
                                    if choiceOptions[2] != "" {
                                        Button {
                                            choiceOptions[2] = ""
                                        } label: {
                                            Image(systemName: "xmark")
                                                .foregroundColor(.textPrimary)
                                                .frame(height: 18)
                                        }
                                    } else {
                                        Button {
                                            let _ = choiceOptions.popLast()
                                        } label: {
                                            Image("Bin")
                                                .foregroundColor(.textSecondary)
                                                .frame(height: 18)
                                        }
                                    }
                                }
                            } else {
                                Button {
                                    choiceOptions.append("")
                                } label: {
                                    HStack {
                                        Image(systemName: "plus")
                                        Text("옵션 추가")
                                        Spacer()
                                    }
                                    .font(.body) // TODO: 디자인 시스템 폰트 추가시 변경
                                    .tint(.textSecondary)
                                }

                            }
                            Divider()
                                .background(Color.tagBase)
                        }
                    }
                }
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 8)
    }
}

private extension UserCustomReviewView {
    /// 객관식 태그가 줄바꿈으로 인해 높이가 늘어났을 때의 높이를 계산해주는 함수
    func viewHeightReader(_ binding: Binding<CGFloat>) -> some View {
        return GeometryReader { geometry -> Color in
            let rect = geometry.frame(in: .local)
            DispatchQueue.main.async {
                binding.wrappedValue = rect.size.height - 42.0
            }
            return .clear
        }
    }
}

//struct UserCustomReviewView_Previews: PreviewProvider {
//    static var previews: some View {
//        UserCustomReviewView()
//    }
//}
