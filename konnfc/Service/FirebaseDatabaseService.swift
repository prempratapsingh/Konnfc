//
//  FirebaseDatabaseService.swift
//  konnfc
//
//  Created by Prem Pratap Singh on 11/06/18.
//  Copyright © 2018 Prem Pratap Singh. All rights reserved.
//

import Foundation
import Firebase

class FirebaseDatabaseService: NSObject {
    
    //-------------------------------------------
    //  PUBLIC PROPERTIES
    //-------------------------------------------
    static var sharedInstance = FirebaseDatabaseService()
    
    
    //-------------------------------------------
    //  PRIVATE PROPERTIES
    //-------------------------------------------
    private var konnexDatabase: DatabaseReference?
    private var konnfcNode: DatabaseReference?
    
    
    //-------------------------------------------
    //  CONSTRUCTOR
    //-------------------------------------------
    override private init() {
        super.init()
        self.konnexDatabase = Database.database().reference()
    }
    
    
    //-------------------------------------------
    //  PUBLIC METHODS
    //-------------------------------------------
    
    /**
     * Addes a new user to the Firebase database users node.
     **/
    func addUserNode(user: User) {
        let usersNode = self.konnexDatabase?.child(FirebaseDatabaseNodes.users)
        let userDetails = [
            FirebaseDatabaseNodes.data: [
                FirebaseDatabaseNodes.userName: user.name,
                FirebaseDatabaseNodes.userEmail: user.email
            ]
        ] as [String:[String:Any]]
        
        let newUserNode = usersNode?.child(user.id)
        newUserNode?.setValue(userDetails)
    }
    
    /**
     * Loads user profile details from the Firebase database
     **/
    func getUser(byId: String, completionHandler:@escaping (_:User?) -> Void) {
        let usersNode = self.konnexDatabase?.child(FirebaseDatabaseNodes.users)
        usersNode?.child(byId).observeSingleEvent(of: .value, with: { snapshot in
            if let dict = snapshot.value as? [String: [String:Any]] {
                print("Logged in user details = \(dict)")
                if let data = dict["data"] as? [String:Any] {
                    let name = data["name"] as? String
                    let email = data["email"] as? String
                    
                    let user = User(name: name!, email: email!)
                    completionHandler(user)
                }
            }
        })
    }
}
