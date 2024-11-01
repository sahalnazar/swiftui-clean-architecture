//
//  PriorityEnum.swift
//  Requests and Inncidents
//
//  Created by Sahal Hassan Nazar on 30/10/24.
//

import SwiftUI

enum Priority: String, CaseIterable, Identifiable, CustomStringConvertible {
    case low = "Low"
    case medium = "Medium"
    case high = "High"
    case critical = "Critical"
    
    var id: String { self.rawValue }
    
    var description: String { self.rawValue }
    
    var color: Color {
        switch self {
        case .low: return Color(hex: "007afe")
        case .medium: return Color(hex: "5c36c9")
        case .high: return Color(hex: "f57337")
        case .critical: return Color(hex: "dc263b")
        }
    }
    
    var backgroundColor: Color {
        switch self {
        case .low: return Color(hex: "e0f4ff")
        case .medium: return Color(hex: "edebf8")
        case .high: return Color(hex: "fef3ed")
        case .critical: return Color(hex: "fdebed")
        }
    }
    
    var filledRectangleCount: Int {
        switch self {
        case .low: return 1
        case .medium: return 2
        case .high: return 3
        case .critical: return 4
        }
    }
}

