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
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @Namespace private var nameSpace
    
    var columns: [GridItem] {
        [
            GridItem(.adaptive(minimum: thumbnailSize.width))
        ]
    }
    
    var thumbnailSize: CGSize {
        var scale: CGFloat = 1
        
        if verticalSizeClass == .regular, horizontalSizeClass == .regular {
            scale = 1.5
        }
        return CGSize(
            width: Settings.thumbnailSize.width * scale,
            height: Settings.thumbnailSize.height * scale
        )
    }
    
    var createButton: some View {
        Button { selectedCard = store.addCard() }
        label: {
            Label(
                "Create New Card",
                systemImage: "plus"
            )
            .frame(maxWidth: .infinity)
        }
        .font(
            .system(size: 16, weight: .bold)
        )
        .padding([.top, .bottom], 10)
        .background(Color.bar).accentColor(.white)
    }
    
    var initialView: some View {
        VStack {
            let card = Card(backgroundColor: Color(uiColor: .systemBackground))
        ZStack {
                CardThumbnail(card: card)
                .matchedTransitionSource(id: card.id, in: nameSpace)
                Image(systemName: "plus.circle.fill")
                .font(.largeTitle)
             }
            .onTapGesture { selectedCard = store.addCard() }
        }
        .frame(width: thumbnailSize.width * 1.2, height: thumbnailSize.height * 1.2)
        .padding(.bottom, 20)
    }
    
    var body: some View {
        VStack {
            ScrollView(showsIndicators: false) {
                LazyVGrid(
                    columns: columns,
                    spacing: 30
                ) {
                    ForEach(store.cards) { card in
                        CardThumbnail(card: card)
                            .frame(
                                width: thumbnailSize.width,
                                height: thumbnailSize.height
                            )
                            .onTapGesture {
                                selectedCard = card
                            }
                    }
                }
            }
            .padding(.top, 20)
            createButton
        }
        .background(
            Color.background
                .ignoresSafeArea()
        )
        .overlay {
            if store.cards.isEmpty {
                    ContentUnavailableView {
                        initialView
                    } description: {
                        Text(
                            "Tap the plus button to add a card"
                        )
                    }
                }
        }
        .fullScreenCover(item: $selectedCard) { card in
            SingleCardView()
                .navigationTransition(.zoom(sourceID: card.id, in: nameSpace))
                .interactiveDismissDisabled(true)
        }
    }
}

#Preview {
    CardsListView()
        .environment(CardStore())
}
