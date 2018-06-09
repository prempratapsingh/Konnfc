//
//  AppModel.swift
//  konnfc
//
//  Created by Prem Pratap Singh on 09/06/18.
//  Copyright © 2018 Prem Pratap Singh. All rights reserved.
//

import Foundation

/**
 * Global model for Konnfc application
 **/
class AppModel: NSObject {
    
    //-------------------------------------------
    //  STATIC PROPERTIES
    //-------------------------------------------
    
    static var sharedInstance = AppModel()
    
    
    //-------------------------------------------
    //  PUBLIC PROPERTIES
    //-------------------------------------------
    
    var isUserSignedin = false
    
    
    //-------------------------------------------
    //  CONSTRUCTOR
    //-------------------------------------------
    
    override private init() {
        // Initializes the AppModel
    }
}
