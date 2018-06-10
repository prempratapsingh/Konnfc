//
//  UserService.swift
//  RxChat
//
//  Created by Prem Pratap Singh on 25/05/18.
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
    func loginUserWith(email: String, password: String, completionHandler: @escaping ( _: Bool, _: User? ) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] user, error in
            if error == nil && user != nil {
                
                let userName = Auth.auth().currentUser?.displayName ?? user?.user.displayName
                self?.user = User(name: userName!.lowercased(), email: email)
                
                // Saving to local storage
                UserDefaults.standard.set(true, forKey: UserDefaultKeys.isUserLoggedIn)
                
                // Adding user login session to the database
                let loginDetails = [
                    FirebaseDatabaseNodes.userName : userName!,
                    FirebaseDatabaseNodes.lastLoginTime : ServerValue.timestamp()
                    ] as [String:Any]
                
                self?.userDatabase?.child(FirebaseDatabaseNodes.userLogin).child(userName!.lowercased()).setValue(loginDetails)
                
                // Reponding back to the view model
                completionHandler(true, self?.user)
            } else {
                print("Error logging in user!")
                
                // Reponding back to the view model
                completionHandler(false, self?.user)
            }
        }
    }
    
    /**
     * Makes call to the Firebase for user signup with name and email.
     * On getting back reponse from Firebase, it delegates call back to the view model
     * via the closure function.
     **/
    func signupUserWith(name: String, email: String, password: String, completionHandler: @escaping (_:Bool) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { user, error in
            if error == nil && user != nil {
                print("User created!")
                print("User details: \(String(describing: user))")
                completionHandler(true)
                
                let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
                changeRequest?.displayName = name
                changeRequest?.commitChanges { error in
                    if error == nil {
                        print("User display name updated!")
                    } else {
                        print("Error updating user display name! \(String(describing: error?.localizedDescription))")
                    }
                }
            } else {
                completionHandler(false)
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
                
                // Removing user login session from the database
                if let user = self.user {
                    let loggedInUser = self.userDatabase?.child(FirebaseDatabaseNodes.userLogin).child(user.name!)
                    loggedInUser?.removeValue()
                }
                completionHandler(true)
                
            } catch {
                completionHandler(false)
            }
        }
    }
}
