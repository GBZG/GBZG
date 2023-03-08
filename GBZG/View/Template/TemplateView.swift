//
//  TempleteView.swift
//  GBZG
//
//  Created by KiWoong Hong on 2022/11/15.
//

import SwiftUI

struct TemplateView: View {
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                ScrollView(showsIndicators: false) {
                    TemplateViewHeader
                }
            }
            .padding(16)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
        }
        .tint(.textField)
    }
}

private extension TemplateView {
    
    // MARK: - TemplateView Header
    
    var TemplateViewHeader: some View {
        HStack {
            Text("내 템플릿")
                .gbzgLargeTitle()
            Spacer()
            NavigationLink(destination: Text("good")) {
                Image(systemName: "plus")
                    .tint(.textField)
            }
        }
        .padding(.bottom, 12)
    }
}

struct TemplateView_Previews: PreviewProvider {
    static var previews: some View {
        TemplateView()
    }
}
