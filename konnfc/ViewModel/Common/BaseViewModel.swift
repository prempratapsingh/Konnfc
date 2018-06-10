//
//  BaseViewModel.swift
//  konnfc
//
//  Created by Prem Pratap Singh on 09/06/18.
//  Copyright © 2018 Prem Pratap Singh. All rights reserved.
//

import Foundation

/**
 * Base class for the ViewModels. It defines the common properties and getter/setter for
 * view delegate and the coordinator delegate
 **/
class BaseViewModel: NSObject {
    
    //-----------------------------------------
    //  PRIVATE PROPERTIES
    //-----------------------------------------
    
    // viewDelegate should be weak referenced as view has direct reference of view model and viewmodel
    // has indirect reference of view through viewdelegate
    private weak var _viewDelegate: ViewDelegate!
    
    // Reference to coordinatorDelegate need not to be weak as viewmodel has reference for the coordinat
    // but coordinator doesn't have any reference to view model.
    // If we set the reference to weak, the coordinatorDelegate will be cleaned from memory and will be
    // set as nil
    private var _coordinatorDelegate: Coordinator!
    
    
    //-----------------------------------------
    //  GETTER/SETTER METHODS
    //-----------------------------------------
    var viewDelegate: ViewDelegate {
        set {
            self._viewDelegate = newValue
        }
        get {
            return _viewDelegate
        }
    }
    
    var coordinatorDelegate: Coordinator {
        set {
            self._coordinatorDelegate = newValue
        }
        get {
            return _coordinatorDelegate
        }
    }
}
