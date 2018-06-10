//
//  BaseCoordinator.swift
//  konnfc
//
//  Created by Prem Pratap Singh on 09/06/18.
//  Copyright © 2018 Prem Pratap Singh. All rights reserved.
//

import UIKit

/**
 Base class for Coordinators. It provides access to the common window and delegate properety and also
 implements Coordinator protocol methods
 **/
class BaseCoordinator: NSObject, Coordinator {
    
    //-------------------------------------------
    //  PRIVATE PROPERTIES
    //-------------------------------------------
    private var _window: UIWindow!
    private weak var _delegate: Coordinator!
    
    //-------------------------------------------
    //  PUBLIC PROPERTIES
    //-------------------------------------------
    
    var window: UIWindow {
        set {
            self._window = newValue
        } get {
            return self._window
        }
    }
    
    var delegate: Coordinator {
        set {
            self._delegate = newValue
        } get {
            return self._delegate
        }
    }
    
    
    //-------------------------------------------
    //  CONSTRUCTOR
    //-------------------------------------------
    
    init(withWindow: UIWindow) {
        super.init()
        self.window = withWindow
    }
    
    
    //-------------------------------------------
    //  PUBLIC METHODS
    //-------------------------------------------
    
    func start() {
        // To be overriden by the subclasses
    }
    
}
