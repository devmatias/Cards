//
//  CardDetailView.swift
//  Cards
//
//  Created by Matias Correa Franco de Faria on 18/06/22.
//

import SwiftUI

struct CardDetailView: View {
    @Environment(\.scenePhase) private var scenePhase
  @EnvironmentObject var viewState: ViewState
  @State private var currentModal: CardModal?
  @State private var stickerImage: UIImage?
  @State private var images: [UIImage] = []
    @State private var frame: AnyShape?
    @State private var textElement =  TextElement()
  @Binding var card: Card

  var body: some View {
    content
      .onDrop(of: [.image], delegate: CardDrop(card: $card))
      .modifier(CardToolbar(currentModal: $currentModal))
      .onChange(of: scenePhase, perform: { newScenePhase in
          if newScenePhase == .inactive {
              card.save()
          }
      })
      .onDisappear {
          card.save()
      }
      .sheet(item: $currentModal) { item in
        switch item {
        case .stickerPicker:
          StickerPicker(stickerImage: $stickerImage)
            .onDisappear {
              if let stickerImage = stickerImage {
                card.addElement(uiImage: stickerImage)
              }
              stickerImage = nil
            }
        case .photoPicker:
          PhotoPicker(images: $images)
          .onDisappear {
            for image in images {
              card.addElement(uiImage: image)
            }
            images = []
          }
        case .framePicker:
            FramePicker(frame: $frame)
                .onDisappear {
                    if let frame = frame {
                        card.update(viewState.selectedElement, frame: frame)
                    }
                    frame = nil
                }
        case .textPicker:
            TextPicker(textElement: $textElement)
                .onDisappear {
                  if !textElement.text.isEmpty {
                    card.addElement(textElement)
                  }
                  textElement = TextElement()
                }
        }
      }
  }

  var content: some View {
    ZStack {
      card.backgroundColor
        .edgesIgnoringSafeArea(.all)
        .onTapGesture {
          viewState.selectedElement = nil
        }
      ForEach(card.elements, id: \.id) { element in
        CardElementView(
          element: element,
          selected: viewState.selectedElement?.id == element.id)
          .contextMenu {
            Button(action: { card.remove(element) }) {
              Label("Delete", systemImage: "trash")
            }
          }
          .resizableView(transform: bindingTransform(for: element))
          .frame(
            width: element.transform.size.width,
            height: element.transform.size.height)
          .onTapGesture {
            viewState.selectedElement = element
          }
      }
    }
  }

  func bindingTransform(for element: CardElement)
    -> Binding<Transform> {
    guard let index = element.index(in: card.elements) else {
      fatalError("Element does not exist")
    }
    return $card.elements[index].transform
  }
}

struct CardDetailView_Previews: PreviewProvider {
  struct CardDetailPreview: View {
    @State private var card = initialCards[0]
    var body: some View {
      CardDetailView(card: $card)
        .environmentObject(ViewState(card: card))
    }
  }
  static var previews: some View {
    CardDetailPreview()
  }
}
