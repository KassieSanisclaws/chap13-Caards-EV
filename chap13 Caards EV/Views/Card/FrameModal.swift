//
//  FrameModal.swift
//  chap13 Caards EV
//
//  Created by Kadeem Cherman on 2026-06-08.
//

import SwiftUI

struct FrameModal: View {
    @Binding var frameIndex: Int?
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    FrameModal(
        frameIndex: .constant(nil)
    )
}
