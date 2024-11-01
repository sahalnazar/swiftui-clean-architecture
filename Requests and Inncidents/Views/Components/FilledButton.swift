//
//  FilledButton.swift
//  Requests and Inncidents
//
//  Created by Sahal Hassan Nazar on 31/10/24.
//

import SwiftUI

struct FilledButton: View {
    let title: String
    let bgColor: Color
    
    init(title: String, bgColor: Color = Color(hex: "002de3")) {
        self.title = title
        self.bgColor = bgColor
    }
    
    var body: some View {
        Text(title)
            .font(.callout)
            .foregroundColor(.white)
            .padding(14)
            .frame(maxWidth: .infinity)
            .background(bgColor)
            .cornerRadius(8)
            .lineLimit(1)
    }
}

#Preview {
    FilledButton(title: "FilledButton")
}
