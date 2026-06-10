//
//  Operators.swift
//  chap13 Caards EV
//
//  Created by Kadeem Cherman on 2026-06-01.
//

import SwiftUI

func + (
    left: CGSize,
    right: CGSize
) -> CGSize {
    
    CGSize(width: left.width + right.width,
           height: left.height + right.height
    )
}
