//
//  UserLoginViewModel.swift
//  RxChat
//
//  Created by Prem Pratap Singh on 20/05/18.
//  Copyright © 2018 Prem Pratap Singh. All rights reserved.
//

import Foundation

/**
 * View model class for user login view
 **/
class UserLoginViewModel: BaseViewModel {
    
    //-------------------------------------------
    //  PUBLIC PROPERTIES
    //-------------------------------------------
    var model: UserModel?
    var userEmail: String?
    var userPassword: String?
    
    
    //-------------------------------------------
    //  GETTER METHODS FOR DELEGATES
    //-------------------------------------------
    var coordinator: UserLoginViewModelCoordinatorDelegate {
        return (coordinatorDelegate as? UserLoginViewModelCoordinatorDelegate)!
    }
    
    var view: UserLoginViewModelViewDelegate {
        return (viewDelegate as? UserLoginViewModelViewDelegate)!
    }
    
    
    //-------------------------------------------
    //  PUBLIC METHODS
    //-------------------------------------------
    
    /**
     * Called by the view to initiate the call to authenticate user login with email and password
     * cominations. On recieving the response from user model, it than delegates back call to the view
     * for handling login success/error.
     **/
    func loginUser() {
        model?.loginUserWith(email: userEmail!, password: userPassword!) { [weak self] response in
            if let error = response.error {
                self?.view.didUserLoginFail(message: error.localizedDescription)
            } else {
                self?.view.didCompleteUserLogin()
            }
        }
    }
    
    /**
     * Called by the view to initiate the change to user signup view.
     **/
    func showUserSignupView() {
        coordinator.showUserSignupView()
    }
    
    /**
     * Called by the view to initiate the change to home view.
     **/
    func showHomeView() {
        
    }
}
