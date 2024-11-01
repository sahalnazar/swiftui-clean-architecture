//
//  PickerView.swift
//  Requests and Inncidents
//
//  Created by Sahal Hassan Nazar on 31/10/24.
//

import SwiftUI

struct PickerView<T: Hashable & CustomStringConvertible>: View {
    let title: String
    @Binding var selection: T?
    let options: [T]

    @State private var isSheetPresented = false

    var body: some View {
        HStack {
            Text(selection?.description.isEmpty == false ? selection!.description : title)
                .font(.subheadline)
                .foregroundColor(Color(hex: "070508"))
                .padding(.leading, 10)

            Spacer()

            Image(systemName: "arrow.up.and.down")
                .foregroundColor(Color(hex: "070508"))
                .padding(.trailing, 10)
        }
        .padding(.vertical, 12)
        .padding(.horizontal, 6)
        .background(Color(hex: "f9f7fa"))
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color(hex: "dadbdf"), lineWidth: 1)
        )
        .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
        .onTapGesture {
            isSheetPresented = true
        }
        .sheet(isPresented: $isSheetPresented) {
            SelectionSheetView(
                title: title, options: options, onSelect: { item in
                    selection = item
                }
            )
        }
    }
}

#Preview {
    PickerView(
        title: "Select Group",
        selection: .constant(Group(id: "1", name: "Group A", organization: "Org A")),
        options: [
            Group(id: "1", name: "Group A", organization: "Org A"),
            Group(id: "2", name: "Group B", organization: "Org B"),
            Group(id: "3", name: "Group C", organization: "Org C")
        ]
    )
}

