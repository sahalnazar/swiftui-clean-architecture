//
//  PriorityIndicatorView.swift
//  Requests and Inncidents
//
//  Created by Sahal Hassan Nazar on 30/10/24.
//

import SwiftUI

import SwiftUI

struct PriorityIndicatorView: View {
    var priority: Priority
    var style: PriorityIndicatorStyle
    
    var body: some View {
        HStack {
            Text(priority.rawValue)
                .font(.caption)
                .foregroundColor(priority.color)
                .frame(maxWidth: style == .full ? .infinity : nil, alignment: style == .full ? .leading : .center)
                .padding(.leading, style == .full ? 8 : 0)
            
            PriorityBarView(priority: priority)
                .frame(maxWidth: style == .full ? .infinity : nil, alignment: style == .full ? .trailing : .center)
        }
        .padding(style == .full ? 8 : 0)
        .background(style == .full ? priority.backgroundColor : Color.clear)
        .cornerRadius(style == .full ? 8 : 0)
    }
}


struct PriorityBarView: View {
    var priority: Priority
    
    var body: some View {
        HStack(spacing: 4) {
            ForEach(0..<4) { index in
                Rectangle()
                    .fill(index < priority.filledRectangleCount ? priority.color : Color(hex: "dce2ed"))
                    .frame(width: 5, height: 12)
            }
        }
    }
}

#Preview {
    VStack(spacing: 20) {
        ForEach(Priority.allCases, id: \.self) { priority in
            PriorityIndicatorView(priority: priority, style: .mini)
                .previewLayout(.sizeThatFits)
        }
        
        ForEach(Priority.allCases, id: \.self) { priority in
            PriorityIndicatorView(priority: priority, style: .full)
                .previewLayout(.sizeThatFits)
        }
    }
    .padding()
}
