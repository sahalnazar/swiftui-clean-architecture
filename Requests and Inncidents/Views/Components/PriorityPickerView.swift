//
//  PriorityPickerView.swift
//  Requests and Inncidents
//
//  Created by Sahal Hassan Nazar on 30/10/24.
//

import SwiftUI

struct PriorityPickerView: View {
    @Binding var selectedPriority: Priority
    @Namespace private var animationNamespace
    
    private var currentBackgroundColor: Color {
        selectedPriority.backgroundColor
    }
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(Priority.allCases) { priority in
                Button(action: {
                    withAnimation(.easeInOut(duration: 0.3)) {
                        selectedPriority = priority
                    }
                }) {
                    Text(priority.description)
                        .font(.subheadline)
                        .bold()
                        .foregroundColor(selectedPriority == priority ? .white : Color(hex: "949cac"))
                        .padding(.vertical, 10)
                        .frame(maxWidth: .infinity)
                        .background(
                            ZStack {
                                if selectedPriority == priority {
                                    RoundedRectangle(cornerRadius: 8)
                                        .fill(priority.color)
                                        .padding(4)
                                        .matchedGeometryEffect(id: "background", in: animationNamespace)
                                }
                            }
                        )
                }
                .buttonStyle(PlainButtonStyle())
            }
        }
        .background(currentBackgroundColor)
        .cornerRadius(8)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color(hex: "dadbdf"), lineWidth: 0.2)
        )
    }
}

#Preview {
    PriorityPickerView(selectedPriority: .constant(.high))
        .previewLayout(.sizeThatFits)
        .padding()
}
