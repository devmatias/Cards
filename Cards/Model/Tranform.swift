//
//  Tranform.swift
//  Cards
//
//  Created by Matias Correa Franco de Faria on 18/06/22.
//

import SwiftUI

struct Transform {
    var size = CGSize(
        width: Settings.defaultElementSize.width,
        height: Settings.defaultElementSize.height)
    var rotation: Angle = .zero
    var offset: CGSize = .zero
}
