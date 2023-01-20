//
//  TextField+.swift
//  GBZG
//
//  Created by Wonhyuk Choi on 2023/01/14.
//

import SwiftUI

struct TextLengthLimiter: ViewModifier {
  @Binding var text: String
  let maxLength: Int

  func body(content: Content) -> some View {
    content
      .onReceive(text.publisher.collect()) { output in
        text = String(output.prefix(maxLength)) // HERE
      }
  }
}

extension TextField {
  func limitTextLength(_ text: Binding<String>, to maxLength: Int) -> some View {
    self.modifier(TextLengthLimiter(text: text, maxLength: maxLength))
  }
}
