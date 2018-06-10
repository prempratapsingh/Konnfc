//
//  UserLoginCoordinator.swift
//  RxChat
//
//  Created by Prem Pratap Singh on 20/05/18.
//  Copyright © 2018 Prem Pratap Singh. All rights reserved.
//

import UIKit

/**
 * This is coordinator class for the Login view.
 * It initializes the view with required properties like view model and delegates call to the
 * app coordinator for changing to different view.
 **/

class UserLoginCoordinator: BaseCoordinator {
    
    //-------------------------------------------
    //  PUBLIC METHODS
    //-------------------------------------------
    
    override func start() {
        let mainSB = UIStoryboard(name: ViewConstants.main, bundle: nil)
        let loginVC = mainSB.instantiateViewController(withIdentifier: ViewConstants.userLogin)
        window.rootViewController = loginVC
    }
}

extension UserLoginCoordinator: UserLoginViewModelCoordinatorDelegate {
    func didCompleteUserLogin() {
        if let coordinatorDelegate = delegate as? UserLoginCoordinatorDelegate {
            coordinatorDelegate.didCompleteUserLogin()
        }
    }
    
    func showUserSignupView() {
        if let coordinatorDelegate = delegate as? UserLoginCoordinatorDelegate {
            coordinatorDelegate.showUserSignupView()
        }
    }
}
