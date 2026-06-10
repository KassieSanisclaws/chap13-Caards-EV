//
//  CardElement.swift
//  chap13 Caards EV
//
//  Created by Kadeem Cherman on 2026-06-03.
//

import SwiftUI

protocol CardElement: Identifiable {
    
    var id: UUID { get }
    var transform: Transform { get set } 
}
