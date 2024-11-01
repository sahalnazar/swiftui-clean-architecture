//
//  AlertMessageView.swift
//  Requests and Inncidents
//
//  Created by Sahal Hassan Nazar on 31/10/24.
//

import SwiftUI

struct AlertMessageView: View {
    let message: String
    let backgroundColor: Color
    
    var body: some View {
        Text(message)
            .font(.caption)
            .bold()
            .foregroundColor(.red)
            .padding(12)
            .frame(maxWidth: .infinity)
            .background(backgroundColor)
            .cornerRadius(12)
    }
}

#Preview {
    AlertMessageView(message: "This request/report is not valid for you", backgroundColor: Color(hex: "faf4e7"))
}
