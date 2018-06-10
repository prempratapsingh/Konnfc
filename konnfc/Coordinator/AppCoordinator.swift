//
//  AppCoordinator.swift
//  konnfc
//
//  Created by Prem Pratap Singh on 09/06/18.
//  Copyright © 2018 Prem Pratap Singh. All rights reserved.
//

import UIKit

/**
 * This is application level (main) coordinator of the application. It instantiates the
 * view specific coordinators like LoginCoordintor, HomeCoordinator, etc and starts their
 * lifecycle.
 *
 * It also act as the delegate of view specific coordinators and provides API to switch application
 * views from one to another
 **/

class AppCoordinator: BaseCoordinator {
    
    //-------------------------------------------
    //  PUBLIC METHODS
    //-------------------------------------------
    
    override func start() {
        if ApplicationModel.sharedInstance.isUserSignedin {
            showHomeView()
        } else {
            showLoginView()
        }
    }
    
    
    //-------------------------------------------
    //  PRIVATE METHODS
    //-------------------------------------------
    
    private func showLoginView() {
        let loginCoordinator = UserLoginCoordinator(withWindow: super.window)
        loginCoordinator.delegate = self
        loginCoordinator.start()
    }
    
    private func showSignupView() {
        let signupCoordinator = UserSignupCoordinator(withWindow: super.window)
        signupCoordinator.delegate = self
        signupCoordinator.start()
    }
    
    private func showHomeView() {
        
    }
}

/**
 * Implmenting delegate methods for UserLoginCoordinatorDelegate
 **/
extension AppCoordinator: UserLoginCoordinatorDelegate {
    func didCompleteUserLogin() {
        showHomeView()
    }
    
    func showUserSignupView() {
        showSignupView()
    }
}

/**
 * Implmenting delegate methods for UserSignupCoordinatorDelegate
 **/
extension AppCoordinator: UserSignupCoordinatorDelegate {
    func didCompleteUseSignup() {
        
    }
    
    func showUserLoginView() {
        showLoginView()
    }
}
