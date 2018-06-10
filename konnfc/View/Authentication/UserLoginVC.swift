//
//  ViewController.swift
//  konnfc
//
//  Created by Prem Pratap Singh on 09/06/18.
//  Copyright © 2018 Prem Pratap Singh. All rights reserved.
//

import UIKit
import SVProgressHUD
import RxSwift
import RxCocoa

/**
 * View Controller for the login view
 **/

class UserLoginVC: BaseViewController {

    //-------------------------------------------
    //  RXSWIFT CONFIGURATION
    //-------------------------------------------
    let bag = DisposeBag()
    
    
    //-------------------------------------------
    //  PUBLIC PROPERTIES
    //-------------------------------------------
    var viewModel: UserLoginViewModel?
    
    
    //-------------------------------------------
    //  VIEW OUTLETS
    //-------------------------------------------
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    
    //-------------------------------------------
    //  VIEW LIFECYCLE METHODS
    //-------------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.viewDelegate = self
        
        setupView()
        bindView()
    }
    
    
    //-------------------------------------------
    // PRIVATE METHODS
    //-------------------------------------------
    func setupView() {
        emailTextField.delegate = self
        emailTextField.returnKeyType = .done
        passwordTextField.delegate = self
        passwordTextField.returnKeyType = .done
        passwordTextField.isSecureTextEntry = true
        
        loginButton.layer.cornerRadius = 15
        loginButton.isUserInteractionEnabled = false
        loginButton.alpha = 0.6
    }
    
    func bindView() {
        Observable.combineLatest(
            emailTextField.rx.text,
            passwordTextField.rx.text,
            resultSelector: { [weak self] userEmail, userPassword in
                if let email = userEmail, let password = userPassword {
                    if email.count > 0 && password.count > 0 {
                        self?.viewModel?.userEmail = email
                        self?.viewModel?.userPassword = password
                        
                        self?.loginButton.isUserInteractionEnabled = true
                        self?.loginButton.alpha = 1.0
                    } else {
                        self?.loginButton.isUserInteractionEnabled = false
                        self?.loginButton.alpha = 0.6
                    }
                }
        }).subscribe().disposed(by: bag)
    }
    
    //-------------------------------------------
    // OUTLET METHODS
    //-------------------------------------------
    @IBAction func didClickOnLoginButton(_ sender: Any) {
        SVProgressHUD.show()
        viewModel?.loginUser()
    }
    
    @IBAction func didClickOnSignupButton(_ sender: Any) {
        viewModel?.showUserSignupView()
    }
}

/**
 * Implementing methods for view model delegate. View model calls this method for view specific functions.
 **/
extension UserLoginVC: UserLoginViewModelViewDelegate {
    
    // Called by the view model when user login is successful. It shows the login success message and than
    // initiates the call to show home view via view model.
    func didCompleteUserLogin() {
        SVProgressHUD.dismiss()
        
        let alert = UIAlertController(title: "User Login", message: "Your login is successful!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default) { [weak self] action in
            alert.dismiss(animated: true, completion: nil)
            self?.viewModel?.showHomeView()
        })
        present(alert, animated: true)
    }
    
    // Called by the view model when user login is failed. It shows the login error message.
    func didUserLoginFail() {
        SVProgressHUD.dismiss()
        
        let alert = UIAlertController(title: "User Login", message: "Your login failed, please try again!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default) { action in
            alert.dismiss(animated: true, completion: nil)
        })
        present(alert, animated: true)
    }
}

/**
 * Implementing methods for text field delegate. Controls the text filled operations.
 **/
extension UserLoginVC: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.becomeFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
