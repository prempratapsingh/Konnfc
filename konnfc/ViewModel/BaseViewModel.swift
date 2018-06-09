//
//  BaseViewModel.swift
//  konnfc
//
//  Created by Prem Pratap Singh on 09/06/18.
//  Copyright © 2018 Prem Pratap Singh. All rights reserved.
//

import Foundation

class BaseViewModel: NSObject {
    
    private var _viewDelegate: Coordinator!
    
    var viewDelegate: Coordinator {
        set {
            self._viewDelegate = newValue
        }
        get {
            return _viewDelegate
        }
    }
    
}
