//
//  CardThumbnail.swift
//  chap13 Caards EV
//
//  Created by Kadeem Cherman on 2026-06-01.
//

import SwiftUI

struct CardThumbnail: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 15)
            .foregroundStyle(Color.random())
            .frame(
                width: Settings.thumbnailSize.width,
                height: Settings.thumbnailSize.height
            )
    }
}

#Preview {
    CardThumbnail()
}
