//
//  ColorExtensions.swift
//  chap13 Caards EV
//
//  Created by Kadeem Cherman on 2026-06-01.
//

import SwiftUI


extension Color {
    
    static let colors: [Color] = [
        .green,
        .red,
        .yellow,
        .blue,
        .orange,
        .pink,
        .purple,
        .gray
    ]
    
    static func random() -> Color {
        colors.randomElement() ?? .black
    }
    
    static let background = Color(.systemGray)
    static let bar = Color(.systemRed)
    static let shadow = Color.black.opacity(0.15)
}
