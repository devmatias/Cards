//
//  CardsView.swift
//  Cards
//
//  Created by Matias Correa Franco de Faria on 18/06/22.
//

import SwiftUI

struct CardsView: View {
    @EnvironmentObject var viewState: ViewState

    var body: some View {
        ZStack {
            CardsListView()
            if !viewState.showAllCards {
                SingleCardView()
            }
        }
    }
}

struct CardsView_Previews: PreviewProvider {
    static var previews: some View {
        CardsView()
            .environmentObject(ViewState())
    }
}
