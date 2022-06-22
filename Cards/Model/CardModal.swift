//
//  CardModal.swift
//  Cards
//
//  Created by Matias Correa Franco de Faria on 18/06/22.
//

import Foundation

enum CardModal: Identifiable {
    var id: Int {
        hashValue
    }
    case photoPicker, framePicker, stickerPicker, textPicker
}
