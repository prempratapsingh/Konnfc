//
//  HomeViewCoordinator.swift
//  konnfc
//
//  Created by Prem Pratap Singh on 13/06/18.
//  Copyright © 2018 Prem Pratap Singh. All rights reserved.
//

import UIKit

/**
 * This is coordinator class for the home view.
 * It initializes the view with required properties like view model and delegates call to the
 * app coordinator for changing to different view.
 **/

class HomeViewCoordinator: BaseCoordinator {
    
    //-------------------------------------------
    //  PUBLIC METHODS
    //-------------------------------------------
    
    override func start() {
        let mainSB = UIStoryboard(name: ViewConstants.main, bundle: nil)
        let homeVC = mainSB.instantiateViewController(withIdentifier: ViewConstants.home) as! HomeVC
        let homeViewModel = HomeViewModel()
        homeViewModel.coordinatorDelegate = self
        homeViewModel.viewDelegate = homeVC
        homeViewModel.model = PostsModel.sharedInstance
        homeViewModel.userModel = UserModel.sharedInstance
        homeVC.viewModel = homeViewModel
        
        self.window.rootViewController = homeVC
    }
}

/**
 * Implmenting delegate methods for HomeViewModelCoordinatorDelegate
 **/
extension HomeViewCoordinator: HomeViewModelCoordinatorDelegate {
    func showUserLoginView() {
        if let coordinatorDelegate = delegate as? HomeViewCoordinatorDelegate {
            coordinatorDelegate.showUserLoginView()
        }
    }
    
    func showUserProfileView() {
        if let coordinatorDelegate = delegate as? HomeViewCoordinatorDelegate {
            coordinatorDelegate.showUserProfileView()
        }
    }
    
    func showAddNoteView() {
        if let coordinatorDelegate = delegate as? HomeViewCoordinatorDelegate {
            coordinatorDelegate.showAddNoteView()
        }
    }
}
