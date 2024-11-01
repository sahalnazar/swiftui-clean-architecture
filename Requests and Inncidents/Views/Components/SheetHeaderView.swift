//
//  SheetHeaderView.swift
//  Requests and Inncidents
//
//  Created by Sahal Hassan Nazar on 31/10/24.
//

import SwiftUI

struct SheetHeaderView: View {
    let title: String
    let subTitle: String?
    var onClose: () -> Void
    
    var body: some View {
        HStack {
            CloseButton(action: {
                onClose()
            })
            
            Spacer()
            
            VStack(alignment: .center, spacing: 4) {
                Text(title)
                    .bold()
                    .font(.subheadline)
                if let unWrappedBubTitle = subTitle {
                    Text(unWrappedBubTitle)
                        .font(.caption)
                        .foregroundColor(Color(hex: "5d6796"))
                }
            }
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal)
        .padding(.vertical, 8)
    }
}

struct CloseButton: View {
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Image(systemName: "xmark")
                .font(.caption)
                .foregroundColor(.white)
                .frame(width: 24, height: 24)
                .background(Color(UIColor.lightGray))
                .clipShape(Circle())
        }
    }
}

#Preview {
    VStack {
        SheetHeaderView(
            title: "Request details", subTitle: nil, onClose: {})
        SheetHeaderView(
            title: "Request details", subTitle: "REQ123SD", onClose: {})
    }
}
