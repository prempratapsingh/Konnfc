//
//  HomeViewModel.swift
//  konnfc
//
//  Created by Prem Pratap Singh on 12/06/18.
//  Copyright © 2018 Prem Pratap Singh. All rights reserved.
//

import Foundation

/**
 * View model class for the Home view.
 **/
class HomeViewModel: BaseViewModel {
    
    //-------------------------------------------
    //  PUBLIC PROPERTIES
    //-------------------------------------------
    var model: PostsModel?
    var userModel: UserModel?
    
    
    //-------------------------------------------
    //  GETTER METHODS FOR DELEGATES
    //-------------------------------------------
    var coordinator: HomeViewModelCoordinatorDelegate {
        return (coordinatorDelegate as? HomeViewModelCoordinatorDelegate)!
    }
    
    var view: HomeViewModelViewDelegate {
        return (viewDelegate as? HomeViewModelViewDelegate)!
    }
    
    
    //-------------------------------------------
    //  PUBLIC METHODS
    //-------------------------------------------
    
    /**
     * Called by the view to initiate the call to load user notes.
     * On recieving the response from user model, it than delegates back call to the view
     * for handling login success/error.
     **/
    func loadUserNotes() {
        model?.loadUserNote { [weak self] response in
            // Process user notes
        }
    }
    
    /**
     * Called by the view to load user profile details.
     **/
    func loadUserDetails() {
        let loggedInUserId = UserDefaults.standard.string(forKey: UserDefaultKeys.loogedInUserId)
        self.userModel?.loadUserDetails(withId: loggedInUserId!) { [weak self] response in
            self?.view.didLoadUserDetails()
        }
    }
    
    /**
     * Called by the view to initiate the change to user profile view.
     **/
    func showUserProfile() {
        coordinator.showUserProfileView()
    }
    
    
    /**
     * Called by the view to initiate the change to add note view.
     **/
    func showAddNoteView() {
        coordinator.showAddNoteView()
    }
    
    /**
     * Called by the view to initiate the user logout workflow.
     **/
    func logoutUser() {
        userModel?.logoutUser{ [weak self] isLoggedOut in
            if isLoggedOut {
                self?.coordinator.showUserLoginView()
            }
        }
    }
}
