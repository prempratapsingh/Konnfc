//
//  UserSignupCoordinator.swift
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

class UserSignupCoordinator: BaseCoordinator {
    
    //-------------------------------------------
    //  PUBLIC METHODS
    //-------------------------------------------
    
    override func start() {
        let mainSB = UIStoryboard(name: ViewConstants.main, bundle: nil)
        let signupVC = mainSB.instantiateViewController(withIdentifier: "UserSignupVC") as! UserSignupVC
        let signupViewModel = UserSignupViewModel()
        signupViewModel.coordinatorDelegate = self
        signupViewModel.model = UserModel.sharedInstance
        signupVC.viewModel = signupViewModel
        
        self.window.rootViewController = signupVC
    }
}

extension UserSignupCoordinator: UserSignupViewModelCoordinatorDelegate {
    func showUserLoginView() {
        if let coordinatorDelegate = delegate as? UserSignupCoordinatorDelegate {
            coordinatorDelegate.showUserLoginView()
        }
    }
}
