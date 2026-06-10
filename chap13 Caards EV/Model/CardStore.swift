//
//  CardStore.swift
//  chap13 Caards EV
//
//  Created by Kadeem Cherman on 2026-06-03.
//

import SwiftUI

@Observable
class CardStore {
    var selectedElement: (any CardElement)?
    var cards: [Card]
 
    init(defaultData: Bool = false) {
        cards = defaultData ? Self.initialCards : Self.load()
    }
    
    // Default data (Ony on first launch)
    static var initialCards: [Card] {
        [
          Card(backgroundColor: .red),
          Card(backgroundColor: .green),
          Card(backgroundColor: .indigo)
        ]
    }
    
    static func load() -> [Card] {
        let url = Card.documentsURL
        guard let files = try? FileManager.default.contentsOfDirectory(
            at: url, includingPropertiesForKeys: nil
         )
          else {
             return []
        }
        return files.compactMap { file in
            guard file.pathExtension == "json" else { return nil }
            guard let data = try? Data(contentsOf: file) else { return nil }
            return try? JSONDecoder().decode(Card.self, from: data)
        }
    }
    
    func addCard() -> Card {
        let card = Card(backgroundColor: Color.random())
        cards.append(card)
        card.save()
        return card
    }
}
