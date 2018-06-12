//
//  FirebaseDatabaseNodes.swift
//  RxChat
//
//  Created by Prem Pratap Singh on 21/05/18.
//  Copyright © 2018 Prem Pratap Singh. All rights reserved.
//

import Foundation

/**
 * Defines names/keys for Firebase database nodes
 **/

class FirebaseDatabaseNodes: NSObject {
    
    // Firebase Database node names
    static let konnfc = "konnfc"
    static let konnex = "konnex"
    
    static let users = "users"
    static let data = "data"
    static let userId = "userId"
    static let userName = "name"
    static let userEmail = "email"
    static let lastLoginTime = "lastLoginTime"
    
    static let posts = "posts"
    static let text = "text"
}
