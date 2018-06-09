//
//  LoginCoordinator.swift
//  konnfc
//
//  Created by Prem Pratap Singh on 09/06/18.
//  Copyright © 2018 Prem Pratap Singh. All rights reserved.
//

import UIKit

/**
 * This is coordinator class for the Login view.
 * It initializes the view with required properties like view model and delegates call to the
 * app coordinator for changing to different view.
 **/
class LoginCoordinator: BaseCoordinator {
    
    //-------------------------------------------
    //  PUBLIC METHODS
    //-------------------------------------------
    
    override func start() {
        let mainSB = UIStoryboard(name: ViewConstants.main, bundle: nil)
        let loginVC = mainSB.instantiateViewController(withIdentifier: ViewConstants.login)
        window.rootViewController = loginVC
    }
}
