//
//  CoordinatorId.swift
//  RxChat
//
//  Created by Prem Pratap Singh on 20/05/18.
//  Copyright © 2018 Prem Pratap Singh. All rights reserved.
//

import Foundation

/**
 * Enumeration for coordinaor ids which need to be kept/cleaned by the app coordinator
 **/

enum CoordinatorId: String {
    
    // Coordinator Ids
    case userLogin  = "userLogin"
    case userSignup = "userSignup"
    case home       = "home"
    case profile    = "profile"
}
