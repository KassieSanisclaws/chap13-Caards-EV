//
//  ToolbarSelection.swift
//  chap13 Caards EV
//
//  Created by Kadeem Cherman on 2026-06-01.
//

import Foundation

enum ToolbarSelection: CaseIterable, Identifiable {
    case photoModal
    case frameModal
    case stickerModal
    case textModal
    
    var id: Int {
        hashValue
    }
}
