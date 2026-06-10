//
//  UIImageExtensions.swift
//  chap13 Caards EV
//
//  Created by Kadeem Cherman on 2026-06-09.
//

import SwiftUI

extension UIImage {
    static var documentsDirectory: URL {
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    }
    
    func save(filename: String) {
        guard let data = jpegData(compressionQuality: 0.8)
        else { return }
        
        let url = Self.documentsDirectory.appendingPathComponent(filename)
        try? data.write(to: url)
    }
    
    static func load(filename: String) -> UIImage? {
        let url = Self.documentsDirectory.appendingPathComponent(filename)
        guard let data = try? Data(contentsOf: url)
        else { return nil }
        
        return UIImage(data: data)
    }
    
    static func delete(filename: String) {
        let url = documentsDirectory.appendingPathComponent(filename)
        try? FileManager.default.removeItem(at: url)
    }
}
