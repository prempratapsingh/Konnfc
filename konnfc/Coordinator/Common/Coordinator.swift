//
//  Coordinator.swift
//  konnfc
//
//  Created by Prem Pratap Singh on 09/06/18.
//  Copyright © 2018 Prem Pratap Singh. All rights reserved.
//

import UIKit

/**
 * Protocol for the Coordinators. It defines the common propertis and methods to be defined
 * by the coordinators
 **/
protocol Coordinator: class {
    
    //-------------------------------------------
    //  PUBLIC PROPERTIES
    //-------------------------------------------
    var window: UIWindow {get set}
    var delegate: Coordinator {get set}
    
    
    //-------------------------------------------
    //  PUBLIC METHODS
    //-------------------------------------------
    func start()
}
