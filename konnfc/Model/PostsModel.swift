//
//  PostsModel.swift
//  konnfc
//
//  Created by Prem Pratap Singh on 12/06/18.
//  Copyright © 2018 Prem Pratap Singh. All rights reserved.
//

import Foundation

/**
 * Model layer for the home veiw model.
 * It interacts with the user services for reading/writing user posts. It also
 * delegates responses from the services back to the view model.
 **/

class PostsModel: NSObject {
    
    //-------------------------------------------
    //  PUBLIC PROPERTIES
    //-------------------------------------------
    static var sharedInstance = PostsModel()
    
    
    //-------------------------------------------
    //  CONSTRUCTOR
    //-------------------------------------------
    override private init() {
        // Initializng PostsModel
    }
    
    
    //-------------------------------------------
    //  PUBLIC METHOD
    //-------------------------------------------
    
    /**
     * Calls user service for logging in user with given email and password
     **/
    func saveUserNote(text: String, completionHandler: @escaping (_:ApiResponse) -> Void) {
        // Call UserService for saving user note
    }
    
    /**
     * Calls user service for logging in user with given email and password
     **/
    func loadUserNote(completionHandler: @escaping (_:ApiResponse) -> Void) {
        // Call UserService for loading user note
    }
}
