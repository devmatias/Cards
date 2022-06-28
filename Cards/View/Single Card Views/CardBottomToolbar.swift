//
//  CardBottomToolbard.swift
//  Cards
//
//  Created by Matias Correa Franco de Faria on 18/06/22.
//

import SwiftUI

struct ToolbarButtonView: View {
  let modal: CardModal
  private let modalButton: [CardModal: (text: String, imageName: String)] = [
    .photoPicker: ("Photos", "photo"),
    .framePicker: ("Frames", "square.on.circle"),
    .stickerPicker: ("Stickers", "heart.circle"),
    .textPicker: ("Text", "textformat")
  ]

  var body: some View {
    if let text = modalButton[modal]?.text,
      let imageName = modalButton[modal]?.imageName {
    VStack {
      Image(systemName: imageName)
        .font(.largeTitle)
      Text(text)
    }
    .padding(.top)
    }
  }
}

struct CardBottomToolbar: View {
  @EnvironmentObject var viewState: ViewState
  @Binding var cardModal: CardModal?

  var body: some View {
    HStack {
      Button(action: { cardModal = .photoPicker }) {
        ToolbarButtonView(modal: .photoPicker)
      }
      Button(action: { cardModal = .framePicker }) {
        ToolbarButtonView(modal: .framePicker)
      }
      .disabled(
        viewState.selectedElement == nil
          || !(viewState.selectedElement.self is ImageElement))
      Button(action: { cardModal = .stickerPicker }) {
        ToolbarButtonView(modal: .stickerPicker)
      }
      Button(action: { cardModal = .textPicker }) {
        ToolbarButtonView(modal: .textPicker)
      }
    }
  }
}

struct CardBottomToolbar_Previews: PreviewProvider {
  static var previews: some View {
    CardBottomToolbar(cardModal: .constant(.stickerPicker))
      .environmentObject(ViewState())
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
