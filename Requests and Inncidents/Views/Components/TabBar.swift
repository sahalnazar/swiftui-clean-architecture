//
//  CustomTabBar.swift
//  Requests and Inncidents
//
//  Created by Sahal Hassan Nazar on 30/10/24.
//

import SwiftUI

struct TabBar: View {
    let tabTitles: [String]
    @Binding var currentSelectedTab: String
    @Namespace private var underlineAnimation
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<tabTitles.count, id: \.self) { index in
                Button(action: {
                    withAnimation {
                        currentSelectedTab = tabTitles[index]
                    }
                }) {
                    VStack {
                        Spacer()
                        Text(tabTitles[index])
                            .font(.footnote)
                            .bold()
                            .foregroundColor(currentSelectedTab == tabTitles[index] ? Color(hex: "002de3") : Color(hex: "939dad"))
                            .padding(.vertical, 1)
                            .frame(maxWidth: .infinity)
                        Spacer()
                        
                        if currentSelectedTab == tabTitles[index] {
                            Color(hex: "002de3")
                                .frame(height: 2)
                                .matchedGeometryEffect(id: "underline", in: underlineAnimation)
                        } else {
                            Color(UIColor.lightGray)
                                .frame(height: 2)
                        }
                    }
                }
            }
        }
        .frame(height: 65)
    }
}


#Preview {
    TabBar(tabTitles: ["All", "Assigned to Myself", "Assigned to My Group"], currentSelectedTab: .constant("All"))
}
