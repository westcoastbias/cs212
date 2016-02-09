//
//  OrangeViewController.swift
//  Homework3
//
//  Created by Jason on 1/25/15.
//  Copyright (c) 2015 CCSF. All rights reserved.
//

import UIKit

class OrangeViewController : UIViewController {
    
    var viewCount: Int = 0
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        print("Orange. viewWillAppear.")
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        ++viewCount
        print("Orange. viewDidAppear.")
        print("Orange has appeared \(viewCount) times.")
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        print("Orange. viewWillDisappear.")
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        
        print("Orange. viewDidDisappear.")
    }
    
}
