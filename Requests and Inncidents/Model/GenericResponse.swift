//
//  GenericResponse.swift
//  Requests and Inncidents
//
//  Created by Sahal Hassan Nazar on 01/11/24.
//

import Foundation

struct GenericResponse<T: Codable>: Codable {
    let statusCode: Int
    let message: String?
    let data: [T]?
    let errors: String?

    enum CodingKeys: String, CodingKey {
        case statusCode = "StatusCode"
        case message = "Message"
        case data = "Data"
        case errors = "Errors"
    }
}
