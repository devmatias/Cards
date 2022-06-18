//
//  VIewExtensions.swift
//  Cards
//
//  Created by Matias Correa Franco de Faria on 18/06/22.
//

import SwiftUI

extension View {
    func resizableView() -> some View {
        return modifier(ResizableView())
    }
}
