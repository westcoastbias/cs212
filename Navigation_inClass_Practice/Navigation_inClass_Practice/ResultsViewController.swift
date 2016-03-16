//
//  ResultsViewController.swift
//  Navigation_inClass_Practice
//
//  Created by Lucas Ruprecht on 3/1/16.
//  Copyright (c) 2016 Lucas Ruprecht. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    var userThrow: String = "No Move"
    
    @IBOutlet weak var label: UILabel!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        label.text = userThrow
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Result"
        
    }
}
