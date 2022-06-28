//
//  TextPicker.swift
//  Cards
//
//  Created by Matias Correa Franco de Faria on 28/06/22.
//

import SwiftUI

struct TextPicker: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding  var textElement: TextElement
    var body: some View {
      let onCommit = {
        presentationMode.wrappedValue.dismiss()
      }
      TextField(
        "Enter text", text: $textElement.text, onCommit: onCommit)
    }
}

struct TextPicker_Previews: PreviewProvider {
    @State static var textElement = TextElement()
    static var previews: some View {
      TextPicker(textElement: $textElement)
    }
}
