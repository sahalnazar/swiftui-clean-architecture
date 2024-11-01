//
//  OutlinedButton.swift
//  Requests and Inncidents
//
//  Created by Sahal Hassan Nazar on 31/10/24.
//

import SwiftUI

struct OutlinedButton: View {
    let title: String
    
    var body: some View {
        Text(title)
            .font(.callout)
            .foregroundColor(Color(hex: "58638e"))
            .padding(14)
            .frame(maxWidth: .infinity)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color(hex: "58638e"), lineWidth: 1)
            )
            .lineLimit(1)
    }
}

#Preview {
    OutlinedButton(title: "OutlinedButton")
}
