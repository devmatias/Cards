//
//  CardsApp.swift
//  Cards
//
//  Created by Matias Correa Franco de Faria on 18/06/22.
//

import SwiftUI

@main
struct CardsApp: App {
    @StateObject var viewState = ViewState()
    @StateObject var store = CardStore()


    var body: some Scene {
        WindowGroup {
            CardsView()
                .environmentObject(viewState)
                .environmentObject(store)
                .onAppear {
                    print(FileManager.documentURL ?? "")
                }
        }
    }
}

