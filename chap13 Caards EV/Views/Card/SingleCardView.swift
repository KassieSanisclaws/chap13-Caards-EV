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
    
    var body: some View {
        NavigationStack {
            GeometryReader { proxy in
                CardDetailsView(card: $card, viewScale: Settings.calculateScale(proxy.size))
                    .frame(width: Settings.calculateSize(proxy.size).width, height: Settings.calculateSize(proxy.size).height)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .sheet(item: $currentModal) { item in
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
                    .toolbar {
                        ToolbarItem(placement: .topBarTrailing) {
                            Button("Done") {
                                dismiss()
                            }
                        }
                        ToolbarItemGroup(placement: .bottomBar) {
                            Button {
                                currentModal = .photoModal
                            } label: {
                                Label("Photos", systemImage: "photo")
                            }
                            Button {
                                currentModal = .frameModal
                            } label: {
                                Label("Frames", systemImage: "square.on.circle")
                            }
                            .disabled(
                                store.selectedElement == nil ||
                                !(store.selectedElement is ImageElement)
                            )
                            Button {
                                currentModal = .stickerModal
                            } label: {
                                Label("Stickers", systemImage: "heart.circle")
                            }
                            Button {
                                currentModal = .textModal
                            } label: {
                                Label("Text", systemImage: "textformat")
                            }
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
