//
//  SelectionSheetView.swift
//  Requests and Inncidents
//
//  Created by Sahal Hassan Nazar on 01/11/24.
//

import SwiftUI

struct SelectionSheetView<T: Hashable & CustomStringConvertible>: View {
    let title: String
    let options: [T]
    let onSelect: (T) -> Void
    @Environment(\.dismiss) var dismiss
    
    @State private var searchText: String = ""

    var body: some View {
        NavigationStack {
            VStack {
                SearchBox(searchText: $searchText, style: .mini)
                    .padding(.horizontal)
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 0) {
                        ForEach(Array(filteredOptions.enumerated()), id: \.element) { index, item in
                            if !item.description.isEmpty {
                                SelectableItem(
                                    item: item,
                                    isLastItem: index == options.count - 1,
                                    onSelect: {
                                        onSelect(item)
                                        dismiss()
                                    }
                                )
                            }
                        }
                    }
                }
            }
            .navigationTitle(title)
            .toolbarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    CloseButton(action: { dismiss() })
                }
            }
        }
        .background(Color.white.ignoresSafeArea())
    }
    
    private var filteredOptions: [T] {
        if searchText.isEmpty {
            return options
        } else {
            return options.filter { $0.description.localizedCaseInsensitiveContains(searchText) }
        }
    }
}

struct SelectableItem<T: CustomStringConvertible>: View {
    let item: T
    let isLastItem: Bool
    let onSelect: () -> Void
    
    var body: some View {
        VStack(spacing: 0) {
            Button(action: onSelect) {
                HStack {
                    Image(systemName: "person.3.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.blue)
                    
                    Text(item.description)
                        .foregroundColor(.primary)
                    
                    Spacer()
                }
                .padding(.vertical, 23)
                .padding(.horizontal)
            }
            
            if !isLastItem {
                DividerView(color: Color(hex: "f2f3f3"), height: 1)
                    .padding(.horizontal)
            }
        }
    }
}


#Preview {
    SelectionSheetView(title: "Select group", options: ["Hello", "help dest"], onSelect: { _ in
        
    })
}
