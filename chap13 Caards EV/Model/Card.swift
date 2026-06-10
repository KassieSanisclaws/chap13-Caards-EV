//
//  Card.swift
//  chap13 Caards EV
//
//  Created by Kadeem Cherman on 2026-06-03.
//

import SwiftUI

struct Card: Identifiable {
    
    var id = UUID()
    var elements: [any CardElement] = []
    static var documentsURL: URL {
        UIImage.documentsDirectory
    }
    var filename: String {
        "\(id.uuidString).json"
    }
}
    
extension Card: Codable {
    
    enum CodingKeys: CodingKey {
        case id, backgroundColor, imageElements, textElements
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let isString = try container.decode(String.self, forKey: .id)
        id = UUID(uuidString: isString) ?? UUID()
        elements += try container.decode([ImageElement].self, forKey: .imageElements)
    }

func save() {
    do {
        let encoder = JSONEncoder()
        let data = try encoder.encode(self)
        let url = Self.documentsURL.appendingPathComponent(filename)
        try data.write(to: url)
    } catch {
        print(error)
    }
}
     
   static func load(
    filname: String
   ) -> Card? {
       let url = documentsURL.appendingPathComponent(filname)
       guard let data = try? Data(contentsOf: url) else {
           return nil
       }
         return try? JSONDecoder().decode(Card.self, from: data)
   }
    
    mutating func update(
        _ element: any CardElement,
            frameIndex: Int
        ) {
            guard let index = elements.firstIndex(
                where: {
                    $0.id == element.id
                })
                    
            else {
                  return
                
            }
            
            guard var image = elements[index] as? ImageElement
                    
            else {
                return
            }
            
            image.frameIndex = frameIndex
            
            elements[index] = image
            
        }
        
        mutating func addElement(
            uiImage: UIImage
        ) {
            
            let imageElement =
            ImageElement(
                uiImage: uiImage
            )
            
            elements.append(imageElement)
        }
        
        mutating func addElement(
            text: String
        ) {
            let text = TextElement(text: text)
            elements.append(text)
        }
      
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id.uuidString, forKey: .id)
        let imageElements: [ImageElement] = elements.compactMap { $0 as? ImageElement }
        try container.encode(imageElements, forKey: .imageElements)
    }
}

