//
//  AppCoordinator.swift
//  konnfc
//
//  Created by Prem Pratap Singh on 09/06/18.
//  Copyright © 2018 Prem Pratap Singh. All rights reserved.
//

import UIKit

/**
 * This is main application level (main) coordinator of the application. It instantiates the
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
        if AppModel.sharedInstance.isUserSignedin {
            showHomeView()
        } else {
            showLoginView()
        }
    }
    
    
    //-------------------------------------------
    //  PRIVATE METHODS
    //-------------------------------------------
    
    private func showHomeView() {
        
    }
    
    private func showLoginView() {
        let loginCoordinator = LoginCoordinator(withWindow: super.window)
        loginCoordinator.delegate = self
        loginCoordinator.start()
    }
    
}