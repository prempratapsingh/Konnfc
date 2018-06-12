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
class ApplicationModel: NSObject {
    
    //-------------------------------------------
    //  STATIC PROPERTIES
    //-------------------------------------------
    static var sharedInstance = ApplicationModel()
    
    
    //-------------------------------------------
    //  CONSTRUCTOR
    //-------------------------------------------
    override private init() {
        // Initializes the AppModel
    }
}
