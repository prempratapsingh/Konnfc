//
//  ApiResponse.swift
//  konnfc
//
//  Created by Prem Pratap Singh on 12/06/18.
//  Copyright © 2018 Prem Pratap Singh. All rights reserved.
//

import Foundation

/**
 * Data object for API responses. It wraps the response/error state and related data.
 **/

class ApiResponse: NSObject {
    
    //-------------------------------------------
    //  PUBLIC PROPERTIES
    //-------------------------------------------
    var message: String?
    var result: Any?
    var error: Error?
}
