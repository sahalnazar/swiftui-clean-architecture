//
//  DividerView.swift
//  Requests and Inncidents
//
//  Created by Sahal Hassan Nazar on 30/10/24.
//

import SwiftUI

struct DividerView: View {
    var color: Color
    var height: CGFloat
    
    var body: some View {
        color
            .frame(height: height)
    }
}

#Preview {
    DividerView(color: Color.blue, height: 1)
}
