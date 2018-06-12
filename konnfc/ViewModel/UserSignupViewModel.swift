//
//  UserSignupViewModel.swift
//  RxChat
//
//  Created by Prem Pratap Singh on 20/05/18.
//  Copyright © 2018 Prem Pratap Singh. All rights reserved.
//

import Foundation

/**
 * View model class for user signup view
 **/
class UserSignupViewModel: BaseViewModel {
    
    //-------------------------------------------
    //  PUBLIC PROPERTIES
    //-------------------------------------------
    var model: UserModel?
    var userName: String?
    var userEmail: String?
    var password: String?
    
    
    //-------------------------------------------
    //  GETTER METHODS FOR DELEGATES
    //-------------------------------------------
    var coordinator: UserSignupViewModelCoordinatorDelegate {
        return (coordinatorDelegate as? UserSignupViewModelCoordinatorDelegate)!
    }
    
    var view: UserSignupViewModelViewDelegate {
        return (viewDelegate as? UserSignupViewModelViewDelegate)!
    }
    
    
    //-------------------------------------------
    //  PUBLIC METHODS
    //-------------------------------------------
    
    /**
     * Called by the view to initiate the call for user signup with required details.
     * On recieving the response from the user model, it than delegates back call to the view
     * for handling signup success/error.
     **/
    func signupUser() {
        model?.signupUserWith(name: userName!, email: userEmail!, password: password!) { [weak self] response in
            if let error = response.error {
                self?.view.didUserSignupFail(message: error.localizedDescription)
            } else {
                 self?.view.didCompleteUserSignup()
            }
        }
    }
    
    /**
     * Called by the view to initiate the change to user login view
     **/
    func showUserLoginView() {
        coordinator.showUserLoginView()
    }
}
