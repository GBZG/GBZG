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
            threeLineView
                .padding(8)
            VStack(alignment: .leading, spacing: 12) {
                HStack {
                    titleLabelView
                    Spacer()
                    xmarkButtonView
                }
                inputView(for: editorType)
            }
            .padding(8)
        }
    }
}

extension EditorRow {
    private var threeLineView: some View {
        Image(systemName: "line.3.horizontal")
            .font(.system(size: 20, weight: .medium))
            .foregroundColor(.textField)
    }
    
    private var titleLabelView: some View {
        Text(editorType.rawValue)
            .font(.system(size: 17, weight: .light))
            .foregroundColor(.primary)
    }
    
    private var xmarkButtonView: some View {
        Button {
            
        } label: {
            Image(systemName: "xmark.app")
                .font(.system(size: 20, weight: .medium))
                .foregroundColor(.textField)
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
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .foregroundColor(.primaryPurple)
                    .frame(width: CGFloat(rating) * geometry.size.width / 5.0 )
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
                    Text("???")
                        .font(.system(size: 15, weight: .light))
                        .foregroundColor(.secondary)
                }
            )
        case .isSuccess:
            return AnyView(
                HStack(spacing: 8) {
                    TagButton(label: "?????? ??????") {
                        
                    }
                    TagButton(label: "?????? ??????") {
                        
                    }
                }
            )
        case .grade:
            return AnyView(
                HStack(spacing: 8) {
                    TagButton(label: "??????") {
                        
                    }
                    TagButton(label: "??????") {
                        
                    }
                    TagButton(label: "??????") {
                        
                    }
                    TagButton(label: "?????? ??????") {
                        
                    }
                }
            )
        case .record:
            return AnyView(
                TextField("???????????? ?????? ???????????? ??????????????????", text: $inputValue)
                    .font(.system(size: 15, weight: .regular))
            )
        }
    }
}

enum EditorType: String {
    case difficulty = "?????? ?????????"
    case hintsUsed = "?????? ?????? ???"
    case isSuccess = "?????? ?????? ??????"
    case grade = "??????"
    case record = "??????"
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
