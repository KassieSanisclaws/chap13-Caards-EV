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
            .foregroundStyle(.mint)
            .frame(width: 150, height: 250)
    }
}

#Preview {
    CardThumbnail()
}
