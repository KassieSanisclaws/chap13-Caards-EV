//
//  chap13_Caards_EVApp.swift
//  chap13 Caards EV
//
//  Created by Kadeem Cherman on 2026-06-01.
//

import SwiftUI

@main
struct chap13_Caards_EVApp: App {
    @State private var store = CardStore()
    var body: some Scene {
        WindowGroup {
            AppLoadingView()
                .environment(store)
        }
    }
}
