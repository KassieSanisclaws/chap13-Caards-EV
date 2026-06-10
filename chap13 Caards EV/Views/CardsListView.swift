//
//  CardsListView.swift
//  chap13 Caards EV
//
//  Created by Kadeem Cherman on 2026-06-01.
//

import SwiftUI

struct CardsListView: View {
    @State private var isPresented = false
    @Environment(CardStore.self) private var store
    @State private var selectedCard: Card?
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                ForEach(store.cards) { card in
                    CardThumbnail()
                        .onTapGesture {
                            selectedCard = card
                        }
                }
                Button("Add New Card") {
                    selectedCard = store.addCard()
                }
            }
        }
        .fullScreenCover(item: $selectedCard) { card in
            SingleCardView()
        }
    }
}

#Preview {
    CardsListView()
        .environment(CardStore())
}
