//
//  AssignedCardData.swift
//  Requests and Inncidents
//
//  Created by Sahal Hassan Nazar on 30/10/24.
//

import Foundation
import SwiftUI

struct AssignedResponse: Codable {
    let statusCode: Int
    let message: String?
    let data: [AssignedCardData]?
    let errors: String?
    
    enum CodingKeys: String, CodingKey {
        case statusCode = "StatusCode"
        case message = "Message"
        case data = "Data"
        case errors = "Errors"
    }
}

struct AssignedCardData: Codable, Identifiable {
    let id = UUID()
    
    let userID: String?
    let userRank: String?
    let userName: String?
    let userLocation: String?
    let userIP: String?
    let details: String?
    let urgency: String?
    let impact: String?
    let priority: String?
    let serviceName: String?
    let note: String?
    let resolution: String?
    let status: String?
    let statusReason: String?
    let assignedGroup: String?
    let reportedDate: String?
    let requestNumber: String?
    let serviceID: String?
    let delayReason: String?
    let assignedGroupID: String?
    let assignedGroupOrg: String?
    let assigneeID: String?
    let assignee: String?
    let mobileNumber: String?
    let phoneNumber: String?
    let userLastName: String?
    let category1: String?
    let category2: String?
    let category3: String?
    
    enum CodingKeys: String, CodingKey {
        case userID = "UserID"
        case userRank = "UserRank"
        case userName = "UserName"
        case userLocation = "UserLocation"
        case userIP = "UserIP"
        case details = "Details"
        case urgency = "Urgency"
        case impact = "Impact"
        case priority = "Priority"
        case serviceName = "ServiceName"
        case note = "Note"
        case resolution = "Resolution"
        case status = "Status"
        case statusReason = "StatusReason"
        case assignedGroup = "AssignedGroup"
        case reportedDate = "ReportedDate"
        case requestNumber = "Request_Number"
        case serviceID = "ServiceID"
        case delayReason = "DelayReason"
        case assignedGroupID = "AssignedGroupID"
        case assignedGroupOrg = "AssignedGroupOrg"
        case assigneeID = "AssigneeID"
        case assignee = "Assignee"
        case mobileNumber = "Mobile_Number"
        case phoneNumber = "Phone_Number"
        case userLastName = "User_Last_Name"
        case category1 = "Category_1"
        case category2 = "Category_2"
        case category3 = "Category_3"
    }
    
    var code: String {
        requestNumber ?? "N/A"
    }
    
    var priorityEnum: Priority {
        Priority.fromString(priority ?? "Low")
    }
    
    var timestamp: String {
        guard let dateStr = reportedDate,
              let date = ISO8601DateFormatter().date(from: dateStr) else {
            return "Unknown Date"
        }
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
    
    var category: String {
        [category1, category2, category3].compactMap { $0 }.joined(separator: " / ")
    }
    
    var applicant: String {
        [userName, userLastName].compactMap { $0 }.joined(separator: " ")
    }
}

extension Priority {
    static func fromString(_ string: String) -> Priority {
        switch string.lowercased() {
        case "low":
            return .low
        case "medium":
            return .medium
        case "high":
            return .high
        case "critical":
            return .critical
        default:
            return .low
        }
    }
}

let dummyAssignedCardData = AssignedCardData(
    userID: "12345",
    userRank: "Captain",
    userName: "John Doe",
    userLocation: "Main Office",
    userIP: "192.168.1.1",
    details: "Sample details for preview purposes.",
    urgency: "4-Low",
    impact: "4-Minor/Localized",
    priority: "Medium",
    serviceName: "Network Services",
    note: nil,
    resolution: nil,
    status: "Assigned",
    statusReason: nil,
    assignedGroup: "IT Support",
    reportedDate: "2023-08-10T12:34:56+00:00",
    requestNumber: "REQ123456",
    serviceID: "SERVICE123",
    delayReason: nil,
    assignedGroupID: "GROUP123",
    assignedGroupOrg: "Tech Department",
    assigneeID: nil,
    assignee: nil,
    mobileNumber: "123456789",
    phoneNumber: "987654321",
    userLastName: "Doe",
    category1: "Support",
    category2: "Networking",
    category3: "Incident"
)
