//
//  CategoryListResponse.swift
//  Requests and Inncidents
//
//  Created by Sahal Hassan Nazar on 01/11/24.
//

import Foundation

struct CategoryListResponse: Codable {
    let statusCode: Int
    let message: String?
    let data: [Category]?
    let errors: String?

    enum CodingKeys: String, CodingKey {
        case statusCode = "StatusCode"
        case message = "Message"
        case data = "Data"
        case errors = "Errors"
    }
}

struct Category: Identifiable, Codable, Hashable, CustomStringConvertible {
    let id: UUID = UUID()
    let label: String?
    let children: [Category]?
    
    var description: String {
          return label ?? ""
      }

    enum CodingKeys: String, CodingKey {
        case label = "Label"
        case children = "Children"
    }
}
