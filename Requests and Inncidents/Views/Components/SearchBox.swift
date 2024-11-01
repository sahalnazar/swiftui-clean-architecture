//
//  SearchBox.swift
//  Requests and Inncidents
//
//  Created by Sahal Hassan Nazar on 30/10/24.
//

import SwiftUI

struct SearchBox: View {
    @Binding var searchText: String
    var style: SearchBoxStyle = .full

    private var textColor: Color {
        Color(hex: style == .full ? "bac0ce" : "828287")
    }

    private var backgroundColor: Color {
        Color(hex: style == .full ? "DADFEB" : "f1eff2")
    }

    private var cornerRadius: CGFloat {
        style == .full ? 24 : 8
    }

    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(textColor)
                .padding(.leading, style == .full ? 14 : 10)
            
            TextField("Search", text: $searchText)
                .padding(.vertical, style == .full ? 10 : 6)
                .padding(.trailing, style == .full ? 10 : 6)
                .background(Color.clear)
                .foregroundColor(searchText.isEmpty ? textColor : Color.black)
        }
        .background(backgroundColor)
        .cornerRadius(cornerRadius)
    }
}


enum SearchBoxStyle {
    case full
    case mini
}

#Preview {
    VStack{
        SearchBox(searchText: .constant("hello"))
            .padding()
        
        SearchBox(searchText: .constant("helloo"), style: .mini)
            .padding()
    }
}
