//
//  ContentView.swift
//  Requests and Inncidents
//
//  Created by Sahal Hassan Nazar on 30/10/24.
//

import SwiftUI

struct ContentView: View {
    let tabTitles = ["All", "Assigned to Myself", "Assigned to My Group"]
    
    @StateObject private var viewModel = AssignedViewModel()
    
    @State private var currentSelectedTab = "All"
    @State private var path = NavigationPath()

    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                TabBar(tabTitles: tabTitles, currentSelectedTab: $currentSelectedTab)
                
                if viewModel.isLoading {
                    ProgressView("Loading...")
                        .padding()
                } else if let error = viewModel.errorMessage {
                    Text("Error: \(error)")
                        .foregroundColor(.red)
                        .padding()
                } else {
                    ScrollView {
                        LazyVStack(spacing: 16) {
                            SearchBox(searchText: $viewModel.searchText)
                            
                            if currentSelectedTab == "All" || currentSelectedTab == "Assigned to Myself" {
                                AssignedSection(
                                    title: "Assigned to myself",
                                    cards: viewModel.filteredAssignedToMyself,
                                    onAssignToMyself: {},
                                    onAssignToMyGroup: { cardData in
                                        path.append(
                                            Destination.assignToMyGroup(
                                            assignedGroupID: cardData.assignedGroupID,
                                            category1Label: cardData.category1,
                                            category2Label: cardData.category2,
                                            category3Label: cardData.category3,
                                            initialPriority: cardData.priorityEnum
                                            )
                                        )
                                    }
                                )
                            }
                            
                            if currentSelectedTab == "All" || currentSelectedTab == "Assigned to My Group" {
                                AssignedSection(
                                    title: "Assigned to my group",
                                    cards: viewModel.filteredAssignedToGroup,
                                    onAssignToMyself: {},
                                    onAssignToMyGroup: { cardData in
                                        path.append(
                                            Destination.assignToMyGroup(
                                            assignedGroupID: cardData.assignedGroupID,
                                            category1Label: cardData.category1,
                                            category2Label: cardData.category2,
                                            category3Label: cardData.category3,
                                            initialPriority: cardData.priorityEnum
                                            )
                                        )
                                    }
                                )
                            }
                            
                            Spacer()
                        }
                        .padding()
                    }
                    .ignoresSafeArea()
                    .tabViewStyle(.page(indexDisplayMode: .never))
                    .navigationTitle("Requests and Incidents")
                    .toolbarTitleDisplayMode(.inline)
                }
            }
            .navigationDestination(for: Destination.self) { destination in
                switch destination {
                case .assignToMyGroup(let assignedGroupID, let category1Label, let category2Label, let category3Label, let initialPriority):
                    EditAssignToGroupView(
                        viewModel: EditAssignToGroupViewModel(
                            assignedGroupID: assignedGroupID,
                            category1Label: category1Label,
                            category2Label: category2Label,
                            category3Label: category3Label,
                            initialPriority: initialPriority
                        )
                    )
                }
            }
        }
    }
}

struct AssignedSection: View {
    let title: String
    let cards: [AssignedCardData]
    let onAssignToMyself: () -> Void
    let onAssignToMyGroup: (AssignedCardData) -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            SectionHeader(title: title)
                .padding(.top, 12)

            ForEach(cards) { cardData in
                AssignedCard(
                    data: cardData,
                    onAssignToMyself: onAssignToMyself,
                    onAssignToMyGroup: { onAssignToMyGroup(cardData) }
                )
            }
        }
    }
}

#Preview {
    ContentView()
}
