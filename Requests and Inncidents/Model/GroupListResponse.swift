//
//  GroupListResponse.swift
//  Requests and Inncidents
//
//  Created by Sahal Hassan Nazar on 01/11/24.
//

import Foundation

struct GroupListResponse: Codable {
    let statusCode: Int
    let message: String?
    let data: [Group]?
    let errors: String?

    enum CodingKeys: String, CodingKey {
        case statusCode = "StatusCode"
        case message = "Message"
        case data = "Data"
        case errors = "Errors"
    }
}

struct Group: Identifiable, Codable, Hashable, CustomStringConvertible {
    let id: String
    let name: String
    let organization: String
    
    var description: String {
           return name
       }

    enum CodingKeys: String, CodingKey {
        case id = "AssignedGroupID"
        case name = "AssignedGroup"
        case organization = "AssignedGroupOrg"
    }
}
