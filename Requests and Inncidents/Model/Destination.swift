//
//  Destination.swift
//  Requests and Inncidents
//
//  Created by Sahal Hassan Nazar on 31/10/24.
//

import SwiftUI

enum Destination: Hashable {
//    case assignToMyself
    case assignToMyGroup(
         assignedGroupID: String?,
         category1Label: String?,
         category2Label: String?,
         category3Label: String?,
         initialPriority: Priority
     )
}


