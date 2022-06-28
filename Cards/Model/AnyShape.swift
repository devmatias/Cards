//
//  AnyShape.swift
//  Cards
//
//  Created by Matias Correa Franco de Faria on 28/06/22.
//

import SwiftUI

struct AnyShape: Shape {
    private let path: (CGRect) -> Path

    func path(in rect: CGRect) -> Path {
        path(rect)
    }

    init<CustomShape: Shape>(_ shape: CustomShape) {
        self.path = { rect in

            shape.path(in: rect)
        }
    }
}

extension AnyShape: Equatable {
    static func == (lhs: AnyShape, rhs: AnyShape) -> Bool {
        let rect = CGRect(
            origin: .zero,
            size: CGSize(width: 100, height: 100))
        let lhsPath = lhs.path(in: rect)
        let rhsPath = rhs.path(in: rect)
        return lhsPath == rhsPath
    }


}
