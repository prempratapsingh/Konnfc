//
//  UserSignupVC.swift
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
 * View Controller for the user signup view
 **/

class UserSignupVC: BaseViewController {

    //-------------------------------------------
    //  RXSWIFT CONFIGURATION
    //-------------------------------------------
    let bag = DisposeBag()
    
    
    //-------------------------------------------
    //  PUBLIC PROPERTIES
    //-------------------------------------------
    var viewModel: UserSignupViewModel?
    
    
    //-------------------------------------------
    //  VIEW OUTLETS
    //-------------------------------------------
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signupButton: UIButton!
    
    
    //-------------------------------------------
    //  VIEW LIFECYCLE METHODS
    //-------------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        bindView()
    }
    
    
    //-------------------------------------------
    // PRIVATE METHODS
    //-------------------------------------------
    func setupView() {
        nameTextField.delegate = self
        nameTextField.returnKeyType = .done
        emailTextField.delegate = self
        emailTextField.returnKeyType = .done
        passwordTextField.delegate = self
        passwordTextField.returnKeyType = .done
        
        signupButton.layer.cornerRadius = 15
        signupButton.isUserInteractionEnabled = false
        signupButton.alpha = 0.6
    }
    
    func bindView() {
        Observable.combineLatest(
            nameTextField.rx.text,
            emailTextField.rx.text,
            passwordTextField.rx.text,
            resultSelector: { [weak self] userName, userEmail, userPassword in
                if let name = userName, let email = userEmail, let password = userPassword {
                    if name.count > 0 && email.count > 0 && password.count > 0 {
                        self?.viewModel?.userName = name
                        self?.viewModel?.userEmail = email
                        self?.viewModel?.password = password
                        
                        self?.signupButton.isUserInteractionEnabled = true
                        self?.signupButton.alpha = 1.0
                    } else {
                        self?.signupButton.isUserInteractionEnabled = false
                        self?.signupButton.alpha = 0.6
                    }
                }
        }).subscribe().disposed(by: bag)
    }
    
    //-------------------------------------------
    // OUTLET METHODS
    //-------------------------------------------
    @IBAction func didClickOnSignupButton(_ sender: Any) {
        SVProgressHUD.show()
        viewModel?.signupUser()
    }
    
    @IBAction func didClickOnBackButton(_ sender: Any) {
        viewModel?.showUserLoginView()
    }
}


/**
 * Implementing methods for view model delegate. View model calls this method for view specific functions.
 **/
extension UserSignupVC: UserSignupViewModelViewDelegate {
    
    // Called by the view model when user signup is successful. It shows the signup success message and than
    // initiates the call to show login view via view model.
    func didCompleteUserSignup() {
        SVProgressHUD.dismiss()
        
        let alert = UIAlertController(title: "User Signup", message: "Your app account is created. Please login with email and password!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default) { [weak self] action in
            alert.dismiss(animated: true, completion: nil)
            self?.viewModel?.showUserLoginView()
        })
        present(alert, animated: true)
    }
    
    // Called by the view model when user signup is failed. It shows the signup error message.
    func didUserSignupFail() {
        SVProgressHUD.dismiss()
        
        let alert = UIAlertController(title: "User Signup", message: "Sorry, Your app account coundn't be created. Please try again!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default) { action in
            alert.dismiss(animated: true, completion: nil)
        })
        present(alert, animated: true)
    }
}

/**
 * Implementing methods for text field delegate. Controls the text filled operations.
 **/
extension UserSignupVC: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.becomeFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

