//
//  Shapes.swift
//  chap13 Caards EV
//
//  Created by Kadeem Cherman on 2026-06-08.
//

import SwiftUI

enum Shapes {
    static let shapes: [AnyShape] = [
        AnyShape(Circle()),
        AnyShape(Rectangle()),
        AnyShape(Cone()),
        AnyShape(Lens()),
        AnyShape(Triangle())
    ]
  }
    

struct Triangle: Shape {
        func path(in rect: CGRect) -> Path {
            let width = rect.width
            let height = rect.height
            
            var path = Path()
            
            path.addLines([
                CGPoint(x: width * 0.13,
                        y: height * 0.2),
                CGPoint(x: width * 0.87,
                        y: height * 0.47),
                CGPoint(x: width * 0.4,
                        y: height * 0.93)
            ])
            path.closeSubpath()
            
            return path
        }
    }
    
    struct Cone: Shape {
        func path(in rect: CGRect) -> Path {
           var path = Path()
            
            let radius = min(rect.midX, rect.midY)
            
            path.addArc(
                center: CGPoint( x: rect.midX, y: rect.midY),
                radius: radius,
                startAngle: .zero,
                endAngle: .degrees(180),
                clockwise: true
            )
            path.addLine(
                to: CGPoint(
                    x: rect.midX,
                    y: rect.height
                )
            )
            path.closeSubpath()
            
            return path
        }
    }
    
    struct Lens: Shape {
        func path(in rect: CGRect) -> Path {
            var path = Path()
            
            path.move ( to: CGPoint(x: 0, y: rect.midY))
            path.addQuadCurve(to: CGPoint(x: rect.width, y: 0),
                              control: CGPoint(x: rect.midX, y: 0))
            
            path.addQuadCurve(to: CGPoint(x: 0, y: rect.midY),
                              control: CGPoint(x: rect.midX, y: rect.height))
            
            path.closeSubpath()
            return path
            
            
        }
    }
