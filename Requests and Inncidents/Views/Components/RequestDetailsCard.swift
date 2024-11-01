//
//  RequestDetailsCard.swift
//  Requests and Inncidents
//
//  Created by Sahal Hassan Nazar on 31/10/24.
//

import SwiftUI

struct RequestDetailsCard: View {
    var priority: Priority
    var reportNumber: String
    var reportTime: String
    var group: String
    var details: String
    var category: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            PriorityIndicatorView(priority: priority, style: .full)
            
            HStack {
                InfoSection(title: "Report number", value: reportNumber)
                
                Spacer()
                
                InfoSection(title: "Report time", value: reportTime)
                    .padding(.horizontal)
            }
            .padding(.top, 10)
            
            DividerView(color: Color(UIColor.lightGray), height: 0.7)
                .padding(.vertical, 10)
            
            InfoSection(title: "Group", value: group)
            
            DividerView(color: Color(UIColor.lightGray), height: 0.7)
                .padding(.vertical, 10)
            
            InfoSection(title: "Details", value: details)
            
            DividerView(color: Color(UIColor.lightGray), height: 0.7)
                .padding(.vertical, 10)
            
            InfoSection(title: "Category", value: category)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.01), radius: 5, x: 0, y: 2)
    }
}



#Preview {
    RequestDetailsCard(
        priority: .high, reportNumber: "123123", reportTime: "today", group: "group", details: "details", category: "category")
}
