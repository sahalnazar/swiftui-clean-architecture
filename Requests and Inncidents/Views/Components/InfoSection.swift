//
//  InfoSection.swift
//  Requests and Inncidents
//
//  Created by Sahal Hassan Nazar on 30/10/24.
//

import SwiftUI

struct InfoSection: View {
    var title: String
    var value: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            Text(title)
                .font(.footnote)
                .foregroundColor(Color(UIColor.darkGray))
            Text(value)
                .bold()
                .font(.subheadline)
        }
    }
}

#Preview {
    InfoSection(title: "Title", value: "Value")
}
