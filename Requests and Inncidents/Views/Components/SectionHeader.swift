//
//  SectionHeader.swift
//  Requests and Inncidents
//
//  Created by Sahal Hassan Nazar on 30/10/24.
//

import SwiftUI

struct SectionHeader: View {
    let title: String
    
    var body: some View {
        Text(title)
            .bold()
            .font(.subheadline)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}
