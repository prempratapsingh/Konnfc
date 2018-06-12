//
//  UserService.swift
//  ConNfc
//
//  Created by Prem Pratap Singh on 09/06/18.
//  Copyright © 2018 Prem Pratap Singh. All rights reserved.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseDatabase

/**
 * Service class for user related operations like - user signup, user login, user signup, user profile load, etc
 * It communicates with the Firebase backend to perform user realted operations.
 **/
class UserService: NSObject {
    
    //-------------------------------------------
    //  PUBLIC PROPERTIES
    //-------------------------------------------
    static let sharedInstance = UserService()
    
    
    //-------------------------------------------
    //  PRIVATE PROPERTIES
    //-------------------------------------------
    private var userDatabase: DatabaseReference?
    private var user: User?
    
    
    //-------------------------------------------
    //  CONSTRUCTOR
    //-------------------------------------------
    private override init() {
        // UserService Initialized
        userDatabase = DatabaseReference.init()
    }
    
    
    //-------------------------------------------
    //  PUBLIC METHODS
    //-------------------------------------------
    
    /**
     * Makes call to the Firebase for loggin in user with email and password.
     * On getting back reponse from Firebase, it delegates call back to the view model
     * via the closure function.
     **/
    func loginUserWith(email: String, password: String, completionHandler: @escaping (_: ApiResponse) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] user, error in
            
            let apiResponse = ApiResponse()
            if error == nil && user != nil {
                let userId = user?.user.uid
                
                // Saving to local storage
                UserDefaults.standard.set(true, forKey: UserDefaultKeys.isUserLoggedIn)
                UserDefaults.standard.set(userId, forKey: UserDefaultKeys.loogedInUserId)
                
                // Loading user details from Firebase database
                FirebaseDatabaseService.sharedInstance.getUser(byId: userId!) { user in
                    self?.user = user
                    apiResponse.result = user
                    completionHandler(apiResponse)
                }
            } else {
                // Reponding back to the view model
                apiResponse.error = error
                completionHandler(apiResponse)
            }
        }
    }
    
    /**
     * Calls the Firebase service to load user details with the given user id.
     **/
    func loadUserDetails(withId:String, completionHandler: @escaping (_:ApiResponse) -> Void) {
        // Loading user details from Firebase database
        FirebaseDatabaseService.sharedInstance.getUser(byId: withId) { user in
            let apiResponse = ApiResponse()
            apiResponse.result = user
            completionHandler(apiResponse)
        }
    }
    
    /**
     * Makes call to the Firebase for user signup with name and email.
     * On getting back reponse from Firebase, it delegates call back to the view model
     * via the closure function.
     **/
    func signupUserWith(name: String, email: String, password: String, completionHandler: @escaping (_:ApiResponse) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { user, error in
            
            let apiResponse = ApiResponse()
            if error == nil && user != nil {
                print("User created!")
                print("User details: \(String(describing: user))")
                
                // Setting user name for the user account
                let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
                changeRequest?.displayName = name
                changeRequest?.commitChanges { error in
                    if error == nil {
                        print("User display name updated!")
                    } else {
                        print("Error updating user display name! \(String(describing: error?.localizedDescription))")
                    }
                }
                
                // Adding user to the users database node
                let newUser = User(name: name, email: email)
                newUser.id = user?.user.uid
                FirebaseDatabaseService.sharedInstance.addUserNode(user: newUser)
                
                // Showing registration success message
                apiResponse.error = nil
                completionHandler(apiResponse)
            } else {
                apiResponse.error = error
                apiResponse.message = error?.localizedDescription
                completionHandler(apiResponse)
            }
        }
    }
    
    /**
     * Makes call to the Firebase for logging out the user from current login session.
     * On getting back reponse from Firebase, it delegates call back to the view model
     * via the closure function.
     **/
    func logoutUser(completionHandler: @escaping (_:Bool) -> Void) {
        if Auth.auth().currentUser != nil {
            do {
                try Auth.auth().signOut()
                
                // Saving to local storage
                UserDefaults.standard.set(false, forKey: UserDefaultKeys.isUserLoggedIn)
                UserDefaults.standard.removeObject(forKey: UserDefaultKeys.loogedInUserId)
                completionHandler(true)
            } catch {
                completionHandler(false)
            }
        }
    }
}
