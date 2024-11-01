//
//  AssignedViewModel.swift
//  Requests and Inncidents
//
//  Created by Sahal Hassan Nazar on 01/11/24.
//

import Foundation
import SwiftUI

@MainActor
class AssignedViewModel: ObservableObject {
    @Published var assignedToGroup: [AssignedCardData] = []
    @Published var assignedToMyself: [AssignedCardData] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    @Published var searchText: String = ""

    private var repository: AssignedRepositoryProtocol
    
    init(repository: AssignedRepositoryProtocol = AssignedRepository()) {
        self.repository = repository
        fetchData()
    }
    
    func fetchData() {
        isLoading = true
        errorMessage = nil
        
        Task {
            do {
                async let groupData = repository.fetchAssignedToGroup()
                async let myselfData = repository.fetchAssignedToMyself()
                
                let (group, myself) = try await (groupData, myselfData)
                
                self.assignedToGroup = group
                self.assignedToMyself = myself
                self.isLoading = false
            } catch {
                self.errorMessage = error.localizedDescription
                self.isLoading = false
            }
        }
    }
    
    var filteredAssignedToGroup: [AssignedCardData] {
        if searchText.isEmpty {
            return assignedToGroup
        } else {
            return assignedToGroup.filter { $0.category.lowercased().contains(searchText.lowercased()) }
        }
    }

    var filteredAssignedToMyself: [AssignedCardData] {
        if searchText.isEmpty {
            return assignedToMyself
        } else {
            return assignedToMyself.filter { $0.category.lowercased().contains(searchText.lowercased()) }
        }
    }
}
