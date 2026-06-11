//
//  ResizableView.swift
//  chap13 Caards EV
//
//  Created by Kadeem Cherman on 2026-06-01.
//

import SwiftUI

struct ResizableView: ViewModifier {
 
    @State private var transform = Transform()
    @State private var previousOffset: CGSize = .zero
    @State private var previousRotation: Angle = .zero
    @State private var scale: CGFloat = 1.0
    let viewScale: CGFloat
 
    func body(content: Content) -> some View {
 
        content
            .frame(
                width: transform.size.width * viewScale,
                height: transform.size.height * viewScale
            )
            .rotationEffect(transform.rotation)
            .scaleEffect(scale)
            .offset(
                x: transform.offset.width * viewScale,
                y: transform.offset.height * viewScale
            )
            .gesture(dragGesture)
            .gesture(
                SimultaneousGesture(
                    rotationGesture,
                    scaleGesture
                )
            )
    }
    
    var dragGesture: some Gesture {
        DragGesture()
            .onChanged { value in
                transform.offset = value.translation + previousOffset
            }
            .onEnded { _ in
                previousOffset = transform.offset
            }
    }
    
    var rotationGesture: some Gesture {
        RotationGesture()
            .onChanged { rotation in
                transform.rotation += rotation - previousRotation
                previousRotation = rotation
            }
            .onEnded { _ in
                previousRotation = .zero
            }
    }
    
    var scaleGesture: some Gesture {
        MagnificationGesture()
            .onChanged { scale in
                self.scale = scale
            }
            .onEnded { scale in
              transform.size.width *= scale
              transform.size.height *= scale
            
               self.scale = 1.0
            }
    }
    
}

#Preview {
    RoundedRectangle(cornerRadius: 30)
        .foregroundStyle(.mint)
        .resizableView()
}

extension View {
    func resizableView(viewScale: CGFloat = 1.0) -> some View {
         modifier(ResizableView(viewScale: viewScale))
    }
}

