//
//  EditorRow.swift
//  GBZG
//
//  Created by Wonhyuk Choi on 2022/11/16.
//

import SwiftUI

struct EditorRow: View {
    let editorType: EditorType
    @State var inputValue: String = ""
    @State var rating: Float = 2.5
    
    var body: some View {
        HStack {
            Image(systemName: "line.3.horizontal")
                .font(.system(size: 20, weight: .medium))
                .foregroundColor(.textField)
                .padding(8)
            VStack(alignment: .leading, spacing: 12) {
                HStack {
                    Text(editorType.rawValue)
                        .lineLimit(1)
                        .font(.system(size: 17, weight: .light))
                        .foregroundColor(.primary)
                    Spacer()
                    Button {
                        
                    } label: {
                        Image(systemName: "xmark.app")
                            .font(.system(size: 20, weight: .medium))
                            .foregroundColor(.textField)
                    }
                }
                inputView(for: editorType)
            }
            .padding(8)
        }
    }
    
    private var starsView: some View {
        HStack(spacing: 8) {
            ForEach(1..<6) { index in
                Image("Star")
                    .foregroundColor(.tagBase)
                    .gesture(TapGesture(count: 2).onEnded {
                        withAnimation(.easeInOut) {
                            rating = Float(index)-0.5
                        }
                    })
                    .simultaneousGesture(TapGesture().onEnded {
                        withAnimation(.easeInOut) {
                            rating = Float(index)
                        }
                    })
            }
        }
    }
    
    private var overlayView: some View {
        GeometryReader { geo in
            ZStack(alignment: .leading) {
                Rectangle()
                    .foregroundColor(.primaryPurple)
                    .frame(width: CGFloat(rating) * geo.size.width / 5.0 )
            }
        }
        .allowsHitTesting(false)
    }
    
    private func inputView(for type: EditorType) -> some View {
        switch type {
        case .difficulty:
            return AnyView(
                starsView
                    .overlay(overlayView.mask(starsView))
            )
        case .hintsUsed:
            return AnyView(
                HStack {
                    TextField("", text: $inputValue)
                        .keyboardType(.decimalPad)
                        .overlay(
                            GeometryReader { geo in
                                Path { path in
                                    path.move(to: CGPoint(x: 0, y: geo.size.height))
                                    path.addLine(to: CGPoint(x: geo.size.width, y: geo.size.height))
                                }
                                .stroke(style: StrokeStyle(lineWidth: 1, dash: [4, 1])) // adjust to your liking
                                .foregroundColor(.secondary)
                            }
                        )
                        .frame(minWidth: 30)
                        .fixedSize(horizontal: true, vertical: false)
                    Text("개")
                        .font(.system(size: 15, weight: .light))
                        .foregroundColor(.secondary)
                }
            )
        case .isSuccess:
            return AnyView(
                HStack(spacing: 8) {
                    Button {
                        
                    } label: {
                        Text("탈출 성공")
                            .font(.system(size: 15, weight: .light))
                            .foregroundColor(.secondary)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 8)
                            .background(Color.tagBase)
                            .cornerRadius(12)
                    }
                    Button {
                        
                    } label: {
                        Text("탈출 실패")
                            .font(.system(size: 15, weight: .light))
                            .foregroundColor(.secondary)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 8)
                            .background(Color.tagBase)
                            .cornerRadius(12)
                    }
                }
            )
        case .grade:
            return AnyView(
                HStack(spacing: 8) {
                    Button {
                        
                    } label: {
                        Text("흙길")
                            .font(.system(size: 15, weight: .light))
                            .foregroundColor(.secondary)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 8)
                            .background(Color.tagBase)
                            .cornerRadius(12)
                    }
                    Button {
                        
                    } label: {
                        Text("풀길")
                            .font(.system(size: 15, weight: .light))
                            .foregroundColor(.secondary)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 8)
                            .background(Color.tagBase)
                            .cornerRadius(12)
                    }
                    Button {
                        
                    } label: {
                        Text("꽃길")
                            .font(.system(size: 15, weight: .light))
                            .foregroundColor(.secondary)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 8)
                            .background(Color.tagBase)
                            .cornerRadius(12)
                    }
                    Button {
                        
                    } label: {
                        Text("인생테마")
                            .font(.system(size: 15, weight: .light))
                            .foregroundColor(.secondary)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 8)
                            .background(Color.tagBase)
                            .cornerRadius(12)
                    }
                }
            )
        case .record:
            return AnyView(
                TextField("기록하고 싶은 내용들을 작성해주세요", text: $inputValue)
                    .font(.system(size: 15, weight: .regular))
            )
        }
    }
}

enum EditorType: String {
    case difficulty = "체감 난이도"
    case hintsUsed = "사용 힌트 수"
    case isSuccess = "테마 성공 여부"
    case grade = "평점"
    case record = "기록"
}

//struct EditorRow_Previews: PreviewProvider {
//    static var previews: some View {
//        VStack {
//            EditorRow(editorType: .difficulty)
//            EditorRow(editorType: .hintsUsed)
//            EditorRow(editorType: .isSuccess)
//            EditorRow(editorType: .grade)
//            EditorRow(editorType: .record)
//        }
//        .previewLayout(.sizeThatFits)
//    }
//}
