//
//  CardElementView.swift
//  chap13 Caards EV
//
//  Created by Kadeem Cherman on 2026-06-03.
//

import SwiftUI

struct CardElementView: View {
 
    let element: any CardElement
    
    @ViewBuilder
    func clippedImage(
        _ image: ImageElement
    ) -> some View {
     
        if let frame =
            image.frameIndex {
     
            image.image
                .resizable()
                .aspectRatio(
                    contentMode: .fit
                )
                .clipShape(
                    Shapes.shapes[frame]
                )
                .contentShape(
                    Ellipse()
                )
     
        } else {
     
            image.image
                .resizable()
                .aspectRatio(
                    contentMode: .fit
                )
        }
    }
 
    var body: some View {
 
        if let image =
            element as? ImageElement {
 
            clippedImage(image)
        }
 
        if let text =
            element as? TextElement {
 
            Text(text.text)
        }
    }
}
