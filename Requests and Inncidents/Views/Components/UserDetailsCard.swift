//
//  UserDetailsCard.swift
//  Requests and Inncidents
//
//  Created by Sahal Hassan Nazar on 30/10/24.
//

import SwiftUI

struct UserDetailsCard: View {
    let userID: String
    let userName: String
    let primaryPhoneNumber: String
    let secondaryPhoneNumber: String
    let title: String
    let value: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(spacing: 16) {
                UserIcon()
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(userID)
                        .bold()
                        .font(.subheadline)
                    Text(userName)
                        .bold()
                        .font(.subheadline)
                    
                    PhoneNumberView(
                        primaryNumber: primaryPhoneNumber,
                        secondaryNumber: secondaryPhoneNumber
                    )
                }
            }
            .padding(.horizontal)
            .padding(.top, 12)
            
            DividerView(color: Color(hex: "f2f3f3"), height: 1)
                .padding(.vertical, 8)
            
            InfoSection(title: title, value: value)
                .padding(.horizontal)
                .padding(.bottom, 12)
        }
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.01), radius: 5, x: 0, y: 2)
    }
}

struct UserIcon: View {
    var body: some View {
        Image(systemName: "person.fill")
            .font(.system(size: 30))
            .foregroundColor(.white)
            .frame(width: 48, height: 48)
            .background(Color(hex: "dae0eb"))
            .clipShape(Circle())
    }
}

struct PhoneNumberView: View {
    let primaryNumber: String
    let secondaryNumber: String?
    
    var body: some View {
        HStack(spacing: 2) {
            PhoneNumberText(number: primaryNumber)
            
            if let secondaryNumber = secondaryNumber {
                Text("-")
                    .font(.caption)
                    .bold()
                    .foregroundColor(.black)
                
                PhoneNumberText(number: secondaryNumber)
            }
        }
    }
}

struct PhoneNumberText: View {
    let number: String
    @Environment(\.openURL) private var openURL
    
    var body: some View {
        Button {
            if let url = URL(string: "tel:\(number)") {
                openURL(url)
            }
        } label: {
            Text(number)
                .font(.caption)
                .bold()
                .underline()
                .foregroundColor(.blue)
        }
        
    }
}



#Preview {
    UserDetailsCard(
        userID: "791239",
        userName: "name asdasd",
        primaryPhoneNumber: "791239",
        secondaryPhoneNumber: "123456",
        title: "title",
        value: "value"
    )
    .previewLayout(.sizeThatFits)
}
