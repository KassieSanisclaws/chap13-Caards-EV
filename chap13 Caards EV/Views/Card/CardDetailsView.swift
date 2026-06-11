//
//  CardDetailsView.swift
//  chap13 Caards EV
//
//  Created by Kadeem Cherman on 2026-06-10.
//

import SwiftUI

struct CardDetailsView: View {
    @Environment(CardStore.self) private var store
    @Binding var card: Card
    var viewScale: CGFloat = 1
    
    func isSelected(_ element: any CardElement ) -> Bool {
        store.selectedElement?.id == element.id
        
    }
    
    var body: some View {
        card.backgroundColor
            .overlay {
                ForEach(Array(card.elements.enumerated()),
                     id: \.offset) {
                     _, element in CardElementView(element: element)
                        .border(Settings.borderColor, width: isSelected(element) ? Settings.borderWidth : 0)
                        .resizableView(viewScale: viewScale)
                        .onTapGesture {
                            store.selectedElement = element
                        }
                }
                
            }
            .contentShape(Rectangle())
            .onTapGesture {store.selectedElement = nil}
            .onDisappear {store.selectedElement = nil}
            .clipped()
    }
}

//#Preview {
//    let store = CardStore()
//    CardDetailsView()
//        .environment(store)
//}
