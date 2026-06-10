//
//  TextElement.swift
//  chap13 Caards EV
//
//  Created by Kadeem Cherman on 2026-06-03.
//

import SwiftUI

struct TextElement: CardElement , Codable {
 
    var id = UUID()
 
    var transform = Transform()
 
    var text: String
}
