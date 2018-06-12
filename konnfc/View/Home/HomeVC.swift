//
//  HomeVC.swift
//  konnfc
//
//  Created by Prem Pratap Singh on 09/06/18.
//  Copyright © 2018 Prem Pratap Singh. All rights reserved.
//

import UIKit
import RxSwift

/**
 * View Controller for the home view
 **/

class HomeVC: BaseViewController {

    //-------------------------------------------
    //  RXSWIFT CONFIGURATION
    //-------------------------------------------
    let bag = DisposeBag()
    
    
    //-------------------------------------------
    //  PUBLIC PROPERTIES
    //-------------------------------------------
    var viewModel: HomeViewModel?
    
    //-------------------------------------------
    //  VIEW OUTLETS
    //-------------------------------------------
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var editProfileButton: UIButton!
    @IBOutlet weak var postsLabel: UILabel!
    
    
    //-------------------------------------------
    //  VIEW LIFECYCLE METHODS
    //-------------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    //-------------------------------------------
    //  PUBLIC METHODS
    //-------------------------------------------
    @IBAction func didClickOnLogoutButton(_ sender: UIButton) {
        let alert = UIAlertController(
            title: LocalizationKeys.HOME_LOGOUT_TITLE.localized(),
            message: LocalizationKeys.HOME_LOGOUT_MESSAGE.localized(),
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: LocalizationKeys.BUTTON_OK.localized(), style: .default) { [weak self] action in
            self?.viewModel?.logoutUser()
            alert.dismiss(animated: true, completion: nil)
        })
        alert.addAction(UIAlertAction(title: LocalizationKeys.BUTTON_CANCEL.localized(), style: .default) { action in
            alert.dismiss(animated: true, completion: nil)
        })
        present(alert, animated: true)
    }
    
    @IBAction func didClickOnViewProfileButton(_ sender: UIButton) {
        viewModel?.showUserProfile()
    }
    
    @IBAction func didClickOnAddNoteButton(_ sender: UIButton) {
        viewModel?.showAddNoteView()
    }
    
    
    //-------------------------------------------
    // PRIVATE METHODS
    //-------------------------------------------
    private func setupView() {
        editProfileButton.setTitle(LocalizationKeys.HOME_VIEW_PROFILE.localized(), for: .normal)
        postsLabel.text = LocalizationKeys.HOME_POSTS.localized()
        
        if let user = viewModel?.userModel?.user {
            self.userNameLabel.text = user.name
        }
    }
    
}

/**
 * Implementing methods for view model' view delegate. Processes the loaded list of user notes.
 **/
extension HomeVC: HomeViewModelViewDelegate {
    func didLoadUserNotes() {
        // Reload notes table data with user notes
    }
}
