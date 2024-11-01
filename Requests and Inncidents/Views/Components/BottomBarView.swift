//
//  BottomBarView.swift
//  Requests and Inncidents
//
//  Created by Sahal Hassan Nazar on 31/10/24.
//

import SwiftUI

struct BottomBarView<Content: View>: View {
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        HStack(spacing: 16) {
            content
        }
        .padding(.vertical, 16)
        .padding(.horizontal)
        .background(Color.white)
        .shadow(color: Color.black.opacity(0.2), radius: 2, x: 0, y: -2)
    }
}


#Preview {
    BottomBarView(content: {
        Button(action: {
            
        }) {
            FilledButton(title: "Assign to myself", bgColor: Color.black)
        }
    })
}
