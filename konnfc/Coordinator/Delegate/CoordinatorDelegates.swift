//
//  CoordinatorDelegates.swift
//  konnfc
//
//  Created by Prem Pratap Singh on 10/06/18.
//  Copyright © 2018 Prem Pratap Singh. All rights reserved.
//

import Foundation

/**
 * Coordinator delegate for user login view.
 * It is used to delegate calls from view coordinator to the app coordinator.
 **/
protocol UserLoginCoordinatorDelegate: class {
    func didCompleteUserLogin()
    func showUserSignupView()
}

/**
 * Coordinator delegate for user login view model.
 * It is used to delegate calls from view model to the view coordinator.
 **/
protocol UserLoginViewModelCoordinatorDelegate: class, ViewDelegate {
    func didCompleteUserLogin()
    func showUserSignupView()
}

/**
 * Coordinator delegate for user signup view.
 * It is used to delegate calls from view coordinator to the app coordinator.
 **/
protocol UserSignupCoordinatorDelegate: class {
    func didCompleteUseSignup()
    func showUserLoginView()
}

/**
 * Coordinator delegate for user signup view model.
 * It is used to delegate calls from view model to the view coordinator.
 **/
protocol UserSignupViewModelCoordinatorDelegate: class, ViewDelegate {
    func showUserLoginView()
}
