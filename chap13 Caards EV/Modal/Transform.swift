//
//  Transform.swift
//  chap13 Caards EV
//
//  Created by Kadeem Cherman on 2026-06-01.
//

import SwiftUI

struct Transform: Codable {
     
    var size = CGSize(
        width: Settings.defaultElementSize.width,
        height: Settings.defaultElementSize.height
        )
    
    var rotation: Angle = .zero
    var offset: CGSize = .zero
}
