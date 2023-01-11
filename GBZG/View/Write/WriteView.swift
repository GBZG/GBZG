//
//  WriteView.swift
//  GBZG
//
//  Created by Noah's Ark on 2023/01/10.
//

import SwiftUI

struct WriteView: View {
    @ObservedObject var viewModel = WriteViewModel()
    @State private var date = Date()
    
    var body: some View {
        ZStack {
            VStack {
                themeTitle
                basicInfoContainer
                customInfoContainer
                Spacer()
            }
            .padding(.horizontal)
            .sheet(isPresented: $viewModel.isSearchViewActive) {
                Text("SearchView Here")
            }
            calendarView
        }
    }
}

private extension WriteView {
    var themeTitle: some View {
        HStack {
            Text("어떤 테마를 기록하시나요?")
                .foregroundColor(.textField)
                .font(.title)
                .fontWeight(.bold)
            Spacer()
        }
        .padding(.top, 28)
        .onTapGesture {
            viewModel.didTapTitleButton()
        }
    }
    
    var basicInfoContainer: some View {
        VStack {
            HStack {
                Text("기본정보")
                Spacer()
                Image(systemName: "chevron.down")
                    .rotationEffect(Angle(
                        degrees: viewModel.isBasicInfoContainerActive ? 180 : 0
                    ))
            }
            .foregroundColor(.textPrimary)
            .font(.subheadline)
            .onTapGesture {
                viewModel.didTapBasicInfoButton()
            }
            
            HStack {
                VStack(alignment: .leading) {
                    BasicInfoContent(title: "방문일") {
                        Text("\(date.convertToKoreanFormat())")
                            .foregroundColor(.textSecondary)
                            .fontWeight(.regular)
                            .onTapGesture {
                                viewModel.didCalendarTapped()
                            }
                    }
                }
                Spacer()
            }
            .frame(height: viewModel.isBasicInfoContainerActive ? 75 : 0)
            .opacity(viewModel.isBasicInfoContainerActive ? 1 : 0)
        }
        .padding(.top, 24)
        .padding(.bottom)
    }
    
    var customInfoContainer: some View {
        VStack {
            HStack {
                Text("추가정보")
                Spacer()
                Image(systemName: "chevron.down")
                    .rotationEffect(Angle(
                        degrees: viewModel.isCustomInfoContainerActive ? 180 : 0
                    ))
            }
            .foregroundColor(.textPrimary)
            .font(.subheadline)
            .onTapGesture {
                viewModel.didTapCustomInfoButton()
            }
            
            VStack {
                Text("Hello World")
                Text("Hello World")
                Text("Hello World")
            }
            .frame(height: viewModel.isCustomInfoContainerActive ? 35 : 0)
            .opacity(viewModel.isCustomInfoContainerActive ? 1 : 0)
        }
    }
    
    var calendarView: some View {
        VStack {
            if viewModel.isCalendarActive {
                DatePicker(
                    "",
                    selection: $date,
                    displayedComponents: [.date]
                )
                .datePickerStyle(.graphical)
                .padding()
                .background(.white)
                .cornerRadius(13)
                .padding(.horizontal)
                .tint(.primaryPurple)
                .onChange(of: date) { _ in
                    viewModel.didCalendarTapped()
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(viewModel.isCalendarActive ? .black.opacity(0.2) : .clear)
    }
}

//struct WriteView_Previews: PreviewProvider {
//    static var previews: some View {
//        WriteView()
//    }
//}

