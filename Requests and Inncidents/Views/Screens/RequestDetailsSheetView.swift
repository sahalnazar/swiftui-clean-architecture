//
//  RequestDetailsView.swift
//  Requests and Inncidents
//
//  Created by Sahal Hassan Nazar on 30/10/24.
//

import SwiftUI

struct RequestDetailsSheetView: View {
    var requestNumber: String
    var userID: String
    var userName: String
    var primaryPhoneNumber: String
    var secondaryPhoneNumber: String
    var userLocation: String
    
    var priority: Priority
    var reportTime: String
    var group: String
    var details: String
    var category: String

    var onAssignToMyself: () -> Void
    var onAssignToMyGroup: () -> Void

    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView {
                    VStack {
                        AlertMessageView(message: "This request/report is not valid for you", backgroundColor: Color(hex: "faf4e7"))
                            .padding(.horizontal)
                        
                        SectionHeader(title: "User details")
                            .padding(.horizontal)
                            .padding(.bottom, 4)
                        
                        UserDetailsCard(
                            userID: userID,
                            userName: userName,
                            primaryPhoneNumber: primaryPhoneNumber,
                            secondaryPhoneNumber: secondaryPhoneNumber,
                            title: "Work place Location",
                            value: userLocation
                        )
                        .padding(.horizontal)
                        
                        SectionHeader(title: "Request details")
                            .padding(.horizontal)
                            .padding(.top, 8)
                        
                        RequestDetailsCard(
                        priority: priority, reportNumber: reportTime, reportTime: reportTime, group: group, details: details, category: category
                        )
                            .padding(.horizontal)
                        
                        Spacer()
                    }
                }
                
                BottomBarView(content: {
                        Button(action: {
                            dismiss()
                            onAssignToMyself()
                        }) {
                            FilledButton(title: "Assign to myself")
                        }
                        
                        Button(action: {
                            dismiss()
                            onAssignToMyGroup()
                        }) {
                            OutlinedButton(title: "Edit/ Assign to group")
                        }
                    }
                )
                .background(Color.white)
            }
            .background(Color(hex: "f6f7f9"))
            .toolbarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    VStack(alignment: .center, spacing: 4) {
                        Text("Request details")
                            .bold()
                            .font(.subheadline)
                        Text(requestNumber)
                            .font(.caption)
                            .foregroundColor(Color(hex: "5d6796"))
                    }
                }
                
                ToolbarItem(placement: .navigationBarLeading) {
                    CloseButton(action: { dismiss() })
                }
            }
        }
        .background(Color(hex: "f6f7f9"))
    }
}


#Preview {
    RequestDetailsSheetView(
        requestNumber: "REQ000000331325",
        userID: "158326",
        userName: "خوله",
        primaryPhoneNumber: "025129121",
        secondaryPhoneNumber: "0504448589",
        userLocation: "الاسكان",
        priority: .high,
        reportTime: "today",
        group: "group",
        details: "details",
        category: "category",
        onAssignToMyself: { },
        onAssignToMyGroup: { }
    )
}
