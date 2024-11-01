//
//  AssignedCard.swift
//  Requests and Inncidents
//
//  Created by Sahal Hassan Nazar on 30/10/24.
//

import SwiftUI

struct AssignedCard: View {
    @State private var isSheetPresented = false
    var data: AssignedCardData
    var onAssignToMyself: () -> Void
    var onAssignToMyGroup: () -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            CardHeaderView(
                iconName: "wrench.and.screwdriver.fill",
                code: data.code,
                priority: data.priorityEnum,
                timestamp: data.timestamp
            )
            
            DividerView(color: Color(UIColor.lightGray), height: 0.7)
                .padding(.vertical, 14)
            
            VStack(alignment: .leading, spacing: 8) {
                InfoSection(title: "Category", value: data.category)
                DividerView(color: Color(UIColor.lightGray), height: 0.7)
                    .padding(.vertical, 4)
                InfoSection(title: "Applicant", value: data.applicant)
            }
            .padding(.horizontal)
            .padding(.bottom, 8)
            
            DividerView(color: .blue, height: 1)
        }
        .background(Color.white)
        .cornerRadius(16)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
        .onTapGesture {
            isSheetPresented = true
        }
        .sheet(isPresented: $isSheetPresented) {
            RequestDetailsSheetView(
                requestNumber: data.code,
                userID: data.userID ?? "",
                userName: data.userName ?? "",
                primaryPhoneNumber: data.mobileNumber ?? "",
                secondaryPhoneNumber: data.phoneNumber ?? "",
                userLocation: data.userLocation ?? "",
                priority: data.priorityEnum,
                reportTime: data.timestamp,
                group: data.assignedGroup ?? "",
                details: data.details ?? "",
                category: data.category,
                onAssignToMyself: {
                onAssignToMyself()
            },
            onAssignToMyGroup: {
                onAssignToMyGroup()
            }
            )
        }
    }
}

struct CardHeaderView: View {
    var iconName: String
    var code: String
    var priority: Priority
    var timestamp: String
    
    var body: some View {
        HStack(spacing: 12) {
            IconView(iconName: iconName)
            
            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Text(code)
                        .bold()
                        .font(.subheadline)
                    Spacer()
                    PriorityIndicatorView(priority: priority, style: .mini)
                }
                Text(timestamp)
                    .font(.caption)
                    .foregroundColor(Color(UIColor.darkGray))
            }
        }
        .padding([.top, .horizontal])
    }
}

struct IconView: View {
    var iconName: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(hex: "eef3f3"))
                .frame(width: 40, height: 40)
            
            Image(systemName: iconName)
                .resizable()
                .scaledToFit()
                .frame(width: 20, height: 20)
                .foregroundColor(Color(hex: "9ba6eb"))
        }
    }
}


#Preview {
    VStack {
        AssignedCard(
            data: dummyAssignedCardData,
            onAssignToMyself: {},
            onAssignToMyGroup: {}
        )
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(Color(UIColor.lightGray))
}
