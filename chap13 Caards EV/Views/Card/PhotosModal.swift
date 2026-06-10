//
//  PhotosModal.swift
//  chap13 Caards EV
//
//  Created by Kadeem Cherman on 2026-06-03.
//

import SwiftUI
import PhotosUI

struct PhotosModal: View {
     
        @Binding var card: Card
     
        @State private var selectedItems: [PhotosPickerItem] = []
     
        var body: some View {
     
            PhotosPicker(

                selection: $selectedItems,
                matching: .images

            ) {
                Label("Photos", systemImage: "photo")
            }

            .onChange(of: selectedItems) {
     
                _, items in
     
                for item in items {
     
                    item.loadTransferable(

                        type: Data.self

                    ) { result in
     
                        Task {
     
                            switch result {
     
                            case .success(let data):
     
                                if let data,

                                   let image =

                                    UIImage(data: data) {
     
                                    await MainActor.run {
     
                                        card.addElement(

                                            uiImage: image

                                        )

                                    }

                                }
     
                            case .failure(let error):
     
                                print(error)

                            }

                        }

                    }

                }
     
                selectedItems = []

            }

        }

    }
     
