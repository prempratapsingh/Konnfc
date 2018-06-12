//
//  ViewDelegates.swift
//  konnfc
//
//  Created by Prem Pratap Singh on 10/06/18.
//  Copyright © 2018 Prem Pratap Singh. All rights reserved.
//

import Foundation

/**
 * Common Type for viewmodel's view delegate. It is used to generlize the view delegate definition.
 **/
protocol ViewDelegate: class {}

/**
 * View delegate for the login view model. It is used to delegate calls from viewmodel to view.
 **/
protocol UserLoginViewModelViewDelegate: class, ViewDelegate {
    func didCompleteUserLogin()
    func didUserLoginFail(message: String)
}

/**
 * View delegate for the signup view model. It is used to delegate calls from viewmodel to view.
 **/
protocol UserSignupViewModelViewDelegate: class, ViewDelegate {
    func didCompleteUserSignup()
    func didUserSignupFail(message: String)
}

/**
 * Coordinator delegate for home view model.
 * It is used to delegate calls from view model to the view coordinator.
 **/
protocol HomeViewModelViewDelegate: class, ViewDelegate {
    func didLoadUserNotes()
    func didLoadUserDetails()
}
