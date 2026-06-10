//
//  CardThumbnail.swift
//  chap13 Caards EV
//
//  Created by Kadeem Cherman on 2026-06-01.
//

import SwiftUI

struct CardThumbnail: View {
    let card: Card
    var body: some View {
        card.backgroundColor
              .cornerRadius(15)
              .shadow( color: .shadow,
                       radius: 3,
                       x: 0,
                       y: 0
                     )
        }
}

#Preview {
    CardThumbnail(
        card: Card()
    )
    .frame(
        width: Settings.thumbnailSize.width,
        height: Settings.thumbnailSize.height
    )
}
