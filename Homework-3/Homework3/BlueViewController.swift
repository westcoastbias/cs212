//
//  BlueViewController.swift
//  Homework3
//
//  Created by Jason on 1/25/15.
//  Copyright (c) 2015 CCSF. All rights reserved.
//

import UIKit

class BlueViewController : UIViewController {
 
    // This is the method that is invoked when the button is pressed
    // in the blue view. We will discuss the @IBAction annotation
    // In the fifth lecture. 
    @IBAction func returnToOrangeController() {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        print("Blue. viewWillAppear.")
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        print("Blue. viewDidAppear.")
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        print("Blue. viewWillDisappear.")
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        
        print("Blue. viewDidDisappear.")
    }
}
