//
//  AssignedRepository.swift
//  Requests and Inncidents
//
//  Created by Sahal Hassan Nazar on 01/11/24.
//

import Foundation

protocol AssignedRepositoryProtocol {
    func fetchAssignedToGroup() async throws -> [AssignedCardData]
    func fetchAssignedToMyself() async throws -> [AssignedCardData]
}

class AssignedRepository: AssignedRepositoryProtocol {
    func fetchAssignedToGroup() async throws -> [AssignedCardData] {
        try await loadJSON(from: "assigned_to_group")
    }
    
    func fetchAssignedToMyself() async throws -> [AssignedCardData] {
        try await loadJSON(from: "assigned_to_myself")
    }
}
