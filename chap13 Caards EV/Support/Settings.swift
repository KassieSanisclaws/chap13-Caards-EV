//
//  Settings.swift
//  chap13 Caards EV
//
//  Created by Kadeem Cherman on 2026-06-01.
//

import SwiftUI

enum Settings {
    
    static let cardSize = CGSize(width: 1300, height: 2000)
    
    static let thumbnailSize = CGSize(width: 150, height: 250)
    
    static let defaultElementSize = CGSize(width: 800, height: 800)
    
    static let borderColor: Color = .green
    
    static let borderWidth: CGFloat = 5
    
    static func calculateSize(
        _ size: CGSize
    ) -> CGSize {
     
        var newSize = size
     
        let ratio =
            Settings.cardSize.width /
            Settings.cardSize.height
     
        if size.width < size.height {
     
            newSize.height =
                min(
                    size.height,
                    newSize.width / ratio
                )
     
            newSize.width =
                min(
                    size.width,
                    newSize.height * ratio
                )
     
        } else {
     
            newSize.width =
                min(
                    size.width,
                    newSize.height * ratio
                )
     
            newSize.height =
                min(
                    size.height,
                    newSize.width / ratio
                )
        }
     
        return newSize
    }
     
    static func calculateScale(
        _ size: CGSize
    ) -> CGFloat {
     
        let newSize =
            calculateSize(size)
     
        return
            newSize.width /
            Settings.cardSize.width
    }
}


