//
//  ViewDelegates.swift
//  konnfc
//
//  Created by Prem Pratap Singh on 10/06/18.
//  Copyright © 2018 Prem Pratap Singh. All rights reserved.
//

import Foundation

protocol UserLoginViewModelViewDelegate: class {
    func didCompleteUserLogin()
    func didUserLoginFail()
}

protocol UserLoginViewModelCoordinatorDelegate: class {
    func didCompleteUserLogin()
    func showUserSignupView()
}

protocol UserSignupViewModelViewDelegate: class {
    func didCompleteUserSignup()
    func didUserSignupFail()
}

protocol UserSignupViewModelCoordinatorDelegate: class {
    func showUserLoginView()
}

protocol UserListViewModelViewDelegate: class {
    func didUserListLoaded()
    func didUserListLoadFailed()
    func didLogoutSuccessfully()
    func didLogutFailed()
}

protocol UserListViewModelCoordinatorDelegate: class {
    func showUserLoginView()
}
