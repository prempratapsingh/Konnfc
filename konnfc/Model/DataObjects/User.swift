//
//  User.swift
//  RxChat
//
//  Created by Prem Pratap Singh on 21/05/18.
//  Copyright © 2018 Prem Pratap Singh. All rights reserved.
//

import Foundation

/**
 * Data object for users.
 * It defines properties and methods for user data related operations.
 **/

class User: NSObject {
    
    //-------------------------------------------
    //  PUBLIC PROPERTIES
    //-------------------------------------------
    var id: String!
    var name: String!
    var email: String!
    
    
    //-------------------------------------------
    //  CONSTRUCTOR
    //-------------------------------------------
    init(name: String, email: String) {
        self.name = name
        self.email = email
        self.id = ""
    }
}
