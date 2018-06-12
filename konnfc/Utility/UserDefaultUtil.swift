//
//  UserDefaultKeys.swift
//  konNfc
//
//  Created by Prem Pratap Singh on 09/06/18.
//  Copyright © 2018 Prem Pratap Singh. All rights reserved.
//

import Foundation

/**
 * Defines keys for UserDefault data persistence
 **/

class UserDefaultKeys: NSObject {
    
    // Key for reading/writing user login/logout state
    static let isUserLoggedIn = "com.xparrow.konnfc.isUserLoggedIn"
    
    // Key for logged in user id
    static let loogedInUserId = "com.xparrow.konnfc.loogedInUserId"
    
    // key for reading/writing Firebase database configuration state
    static let isDatabaseConfigured = "com.xparrow.konnfc.isDatabaseConfigured"
}
