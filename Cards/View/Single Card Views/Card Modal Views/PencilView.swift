//
//  PKCanvasView.swift
//  Cards
//
//  Created by Matias Correa Franco de Faria on 28/06/22.
//

import SwiftUI
import PencilKit

struct PencilView: View {
  @State private var canvas = PKCanvasView()

  var body: some View {
    PencilViewRepresentable(canvas: $canvas)
  }
}

struct PencilViewRepresentable: UIViewRepresentable {
  @Binding var canvas: PKCanvasView

  func makeUIView(context: Context) -> some UIView {
    canvas.drawingPolicy = .anyInput
    return canvas
  }

  func updateUIView(_ uiView: UIViewType, context: Context) {
  }
}

struct PencilView_Previews: PreviewProvider {
  static var previews: some View {
    PencilView()
  }
}
