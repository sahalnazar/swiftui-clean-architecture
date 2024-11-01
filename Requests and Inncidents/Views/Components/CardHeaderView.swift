//
//  CardHeaderView.swift
//  Requests and Inncidents
//
//  Created by Sahal Hassan Nazar on 30/10/24.
//

import SwiftUI

struct CardHeaderView: View {
    var iconName: String
    var code: String
    var priority: Priority
    var timestamp: String
    
    var body: some View {
        HStack {
            IconView(iconName: iconName)
            
            VStack(alignment: .leading) {
                HStack {
                    Text(code)
                        .bold()
                        .font(.subheadline)
                    Spacer()
                    PriorityIndicatorView(priority: priority)
                }
                Text(timestamp)
                    .font(.caption)
                    .foregroundColor(Color(UIColor.darkGray))
            }
        }
        .padding(.vertical)
        .padding(.horizontal)
    }
}

#Preview {
    CardHeaderView()
}
