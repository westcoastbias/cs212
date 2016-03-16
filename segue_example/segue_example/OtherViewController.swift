//
//  OtherViewController.swift
//  segue_example
//
//  Created by Lucas Ruprecht on 2/23/16.
//  Copyright (c) 2016 Lucas Ruprecht. All rights reserved.
//

import UIKit

class OtherViewController: UIViewController {

    @IBOutlet var label: UILabel!
    
    var percentage: Float = 0.22
    
    @IBAction func dismiss(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        label.text = "\(percentage * 100.0)%"
    }

}
