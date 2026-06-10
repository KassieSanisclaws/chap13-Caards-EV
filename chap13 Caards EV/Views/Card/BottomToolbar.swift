//
//  BottomToolbar.swift
//  chap13 Caards EV
//
//  Created by Kadeem Cherman on 2026-06-01.
//

import SwiftUI

struct ToolbarButton: View {
    let  modal: ToolbarSelection
    private let modalButton: [
        ToolbarSelection: (text: String, imageName: String)
    ] = [
        .photoModal: ("Photos", "photo"),
        .frameModal: ("Frames", "square.on.circle"),
        .stickerModal: ("Stickers", "heart.circle"),
        .textModal: ("Text", "textformat")
    ]
   
    var body: some View {
        if let text = modalButton[modal]?.text,
           let imageName = modalButton[modal]?.imageName {
            
            VStack {
                Image(systemName: imageName)
                    .font(.largeTitle)
                
                    Text(text)
            }
            .padding(.top)
        }
    }
}

struct BottomToolbar: View {
    @Binding var modal: ToolbarSelection?
    @Binding var card: Card
    @Environment(CardStore.self)
    private var store
    
    func defaultButton(
        _ selection: ToolbarSelection
    ) -> some View {
     
        Button {
     
            modal = selection
     
        } label: {
     
            ToolbarButton(
                modal: selection
            )
        }
    }
    
    var body: some View {
        HStack {
            ForEach(
                ToolbarSelection.allCases,
                id: \.self
            ) { selection in
             
                switch selection {
             
                case .frameModal:
             
                    defaultButton(selection)
                        .disabled(
                            store.selectedElement == nil
                            || !(store.selectedElement is ImageElement)
                        )
             
                default:
             
                    defaultButton(selection)
                }
            }
        }
    }
}

#Preview {
    BottomToolbar(
        modal: .constant(.stickerModal),
        card: .constant(Card())
        )
    .environment(CardStore())
}
