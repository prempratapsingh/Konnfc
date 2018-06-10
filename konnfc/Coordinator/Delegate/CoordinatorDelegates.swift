//
//  CoordinatorDelegates.swift
//  konnfc
//
//  Created by Prem Pratap Singh on 10/06/18.
//  Copyright © 2018 Prem Pratap Singh. All rights reserved.
//

import Foundation

protocol UserLoginCoordinatorDelegate: class {
    func didCompleteUserLogin()
    func showUserSignupView()
}

protocol UserSignupCoordinatorDelegate: class {
    func didCompleteUseSignup()
    func showUserLoginView()
}
