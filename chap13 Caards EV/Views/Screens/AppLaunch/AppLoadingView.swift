//
//  AppLoadingView.swift
//  chap13 Caards EV
//
//  Created by Kadeem Cherman on 2026-06-10.
//

import SwiftUI

struct AppLoadingView: View {
    @State private var showSplash = true
    var body: some View {
        if showSplash {
            SplashScreen()
                .ignoresSafeArea()
                .onAppear {
                    withAnimation(.linear(duration: 1).delay(1.5))
                    {
                        showSplash = false
                    }
                }
        } else {
            CardsListView().transition(.scale(scale: 0, anchor: .top))
          }
     }
}

#Preview {
    AppLoadingView()
        .environment(CardStore())
}
