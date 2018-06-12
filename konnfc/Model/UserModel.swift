//
//  UserModel.swift
//  RxChat
//
//  Created by Prem Pratap Singh on 20/05/18.
//  Copyright © 2018 Prem Pratap Singh. All rights reserved.
//

import Foundation

/**
 * Model layer for the login veiw model.
 * It interacts with the user services for backend operations and data retrieval. It also
 * delegates responses from the services back to the view model.
 **/
class UserModel: NSObject {
    
    //-------------------------------------------
    //  PUBLIC PROPERTIES
    //-------------------------------------------
    static var sharedInstance = UserModel()
    var user: User?
    
    
    //-------------------------------------------
    //  CONSTRUCTOR
    //-------------------------------------------
    override private init() {
        // Initializng UserModel
    }
    
    
    //-------------------------------------------
    //  PUBLIC METHOD
    //-------------------------------------------
    
    /**
     * Calls user service for logging in user with given email and password
     **/
    func loginUserWith(email: String, password: String, completionHandler: @escaping (_:ApiResponse) -> Void) {
        UserService.sharedInstance.loginUserWith(email: email, password: password) { [weak self] response in
            self?.user = response.result as? User
            completionHandler(response)
        }
    }
    
    /**
     * Calls user service for signing up user with given details like name and email
     **/
    func signupUserWith(name: String, email: String, password: String, completionHandler: @escaping (_:ApiResponse) -> Void) {
        UserService.sharedInstance.signupUserWith(name: name, email: email, password: password) { response in
            completionHandler(response)
        }
    }
    
    /**
     * Calls user service for logging out user
     **/
    func logoutUser(completionHandler: @escaping (_:Bool) -> Void) {
        UserService.sharedInstance.logoutUser { isLoggedOut in
            completionHandler(isLoggedOut)
        }
    }
}
