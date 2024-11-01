//
//  GroupsCategoriesViewModel.swift
//  Requests and Inncidents
//
//  Created by Sahal Hassan Nazar on 01/11/24.
//

import Foundation

@MainActor
class EditAssignToGroupViewModel: ObservableObject {
    @Published var groups: [Group] = []
    @Published var categories: [Category] = []
    
    @Published var selectedGroup: Group?
    @Published var selectedCategory1: Category?
    @Published var selectedCategory2: Category?
    @Published var selectedCategory3: Category?
    @Published var selectedPriority: Priority
    @Published var comments: String
    
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    private let repository: GroupsCategoriesRepositoryProtocol
    
    private let assignedGroupID: String?
    private let category1Label: String?
    private let category2Label: String?
    private let category3Label: String?
    
    var availableCategory2: [Category] {
        selectedCategory1?.children ?? []
    }
    
    var availableCategory3: [Category] {
        selectedCategory2?.children ?? []
    }
    
    init(
        assignedGroupID: String?,
        category1Label: String?,
        category2Label: String?,
        category3Label: String?,
        initialPriority: Priority,
        initialComments: String = "",
        repository: GroupsCategoriesRepositoryProtocol = GroupsCategoriesRepository()
    ) {
        self.assignedGroupID = assignedGroupID
        self.category1Label = category1Label
        self.category2Label = category2Label
        self.category3Label = category3Label
        self.selectedPriority = initialPriority
        self.comments = initialComments
        self.repository = repository
    }
    
    func loadGroupsAndCategories() async {
        self.isLoading = true
        do {
            async let groupsTask = repository.fetchGroups()
            async let categoriesTask = repository.fetchCategories()
            
            let (fetchedGroups, fetchedCategories) = try await (groupsTask, categoriesTask)
            
            self.groups = fetchedGroups
            self.categories = fetchedCategories
            
            self.selectedGroup = fetchedGroups.first(where: { $0.id == self.assignedGroupID })
            self.selectedCategory1 = fetchedCategories.first(where: { $0.label == self.category1Label })
            self.selectedCategory2 = self.availableCategory2.first(where: { $0.label == self.category2Label })
            self.selectedCategory3 = self.availableCategory3.first(where: { $0.label == self.category3Label })
            
            self.isLoading = false
        } catch {
            self.errorMessage = "Failed to load groups or categories: \(error.localizedDescription)"
            self.isLoading = false
        }
    }
}
