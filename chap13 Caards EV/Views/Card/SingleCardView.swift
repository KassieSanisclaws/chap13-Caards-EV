//
//  SingleCardView.swift
//  chap13 Caards EV
//
//  Created by Kadeem Cherman on 2026-06-01.
//

import SwiftUI

struct SingleCardView: View {
    @Environment(CardStore.self) private var store
    @Environment(\.dismiss) var dismiss
    @State private var currentModal: ToolbarSelection?
    @State private var stickerImage: UIImage?
    @State private var card = Card()
    @State private var frameIndex: Int?
    @Environment(\.scenePhase) private var scenePhase
    
    func isSelected(
       _ element: any CardElement
    ) -> Bool {
        store.selectedElement?.id == element.id
    }
    
    var content: some View {
        ZStack {
                ForEach(
                    Array(card.elements.enumerated()),
                    id: \.offset
                ) { _, element in
                    CardElementView(
                        element: element
                            
                    )
                    .border(
                        Settings.borderColor,
                        width: isSelected(element)
                        ? Settings.borderWidth : 0 
                    )
                    .resizableView()
                    .onTapGesture {
                        store.selectedElement  = element
                    }
                }
            }
        .contentShape(Rectangle())
        .onTapGesture {
            store.selectedElement = nil
         }
        .onDisappear {
            store.selectedElement = nil
        }
     }
    
    var body: some View {
        NavigationStack {
            content
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button("Done") {
                            dismiss()
                        }
                    }
                    ToolbarItem(placement: .bottomBar) {
                        BottomToolbar(
                            modal: $currentModal,
                            card: $card
                        )
                    }
                }
                .sheet(item: $currentModal) {
                    item in
                    switch item {
                    case .stickerModal:
                     
                        StickerModal(
                            stickerImage: $stickerImage
                        )
                        .onDisappear {
                     
                            if let image = stickerImage {
                     
                                card.addElement(
                                    uiImage: image
                                )
                            }
                     
                            stickerImage = nil
                        }
                        
                    case .frameModal:
                         FrameModal(
                        frameIndex: $frameIndex
                        )
                    .onDisappear {
                        if let frameIndex,
                           let selected =
                            store.selectedElement {
                            
                            card.update(
                                selected,
                                frameIndex: frameIndex)
                        }
                        self.frameIndex = nil
                    }
                    
                        
                    default:
                        Text(String(describing: item))
                    }
                }
         }
        .onChange(of: scenePhase) {
            _, newPhase in
              print("Scene Phase:", newPhase)
            if newPhase == .inactive {
              print("Save Button Triggered")
                card.save()
            }
        }
    }
}

#Preview {
    SingleCardView()
        .environment(CardStore())
}
