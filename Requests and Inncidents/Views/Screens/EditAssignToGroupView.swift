//
//  EditAssignToGroupView.swift
//  Requests and Inncidents
//
//  Created by Sahal Hassan Nazar on 31/10/24.
//

import SwiftUI

struct EditAssignToGroupView: View {
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var viewModel: EditAssignToGroupViewModel
    
    
    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    SectionHeader(title: "Select group")
                    
                    PickerView(
                        title: viewModel.selectedGroup?.name ?? "Select Group",
                        selection: $viewModel.selectedGroup,
                        options: viewModel.groups
                    )
                    
                    SectionHeader(title: "Select categories")
                        .padding(.top)
                    
                    VStack(spacing: 16) {
                        PickerView(
                            title: "Select Category 1",
                            selection: Binding(
                                get: { viewModel.selectedCategory1 },
                                set: { value in
                                    viewModel.selectedCategory1 = value
                                    viewModel.selectedCategory2 = nil
                                    viewModel.selectedCategory3 = nil
                                }),
                            options: viewModel.categories
                        )
                        
                        PickerView(
                            title: "Select Category 2",
                            selection: Binding(
                                get: { viewModel.selectedCategory2 },
                                set: { value in
                                    viewModel.selectedCategory2 = value
                                    viewModel.selectedCategory3 = nil
                                }),
                            options: viewModel.availableCategory2
                        )
                        
                        PickerView(
                            title: "Select Category 3",
                            selection: $viewModel.selectedCategory3,
                            options: viewModel.availableCategory3
                        )
                    }
                    .padding()
                    .background(Color(hex: "f2f2f7"))
                    .cornerRadius(12)
                    
                    SectionHeader(title: "Priority")
                        .padding(.top)
                    
                    PriorityPickerView(selectedPriority: $viewModel.selectedPriority)
                    
                    SectionHeader(title: "Comments")
                        .padding(.top)
                    
                    TextField("", text: $viewModel.comments, axis: .vertical)
                        .lineLimit(4, reservesSpace: true)
                        .padding(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color(hex: "dadbdf"), lineWidth: 1)
                        )
                    
                    NavigationLink(destination: Text("Previous comments")) {
                        Text("View previous comments")
                            .font(.footnote)
                            .padding(.top)
                            .foregroundColor(Color(hex: "566acd"))
                            .underline(color: Color(hex: "3d79c1"))
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    
                    Spacer()
                }
                .padding()
            }
            BottomBarView(content: {
                Button(action: {
                    dismiss()
                }) {
                    FilledButton(title: "Save", bgColor: Color(hex: "2ab775"))
                }
            })
        }
        .navigationTitle("Edit/ Assign to group")
        .toolbarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    dismiss()
                }) {
                    HStack {
                        Image(systemName: "chevron.backward")
                        Text("Back")
                    }
                }
            }
        }
        .onAppear {
            Task {
                await viewModel.loadGroupsAndCategories()
            }
        }
    }
}


#Preview {
    NavigationStack {
        EditAssignToGroupView(
            viewModel: EditAssignToGroupViewModel(
                assignedGroupID: "group123",
                category1Label: "Category A",
                category2Label: "Category B",
                category3Label: "Category C",
                initialPriority: .medium,
                initialComments: "Initial comment"
            )
        )
    }
}
