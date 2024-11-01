//
//  GroupsCategoriesRepository.swift
//  Requests and Inncidents
//
//  Created by Sahal Hassan Nazar on 01/11/24.
//

import Foundation

protocol GroupsCategoriesRepositoryProtocol {
    func fetchGroups() async throws -> [Group]
    func fetchCategories() async throws -> [Category]
}

class GroupsCategoriesRepository: GroupsCategoriesRepositoryProtocol {
    func fetchGroups() async throws -> [Group] {
        try await loadJSON(from: "group_list")
    }
    
    func fetchCategories() async throws -> [Category] {
        try await loadJSON(from: "category_list")
    }
}
