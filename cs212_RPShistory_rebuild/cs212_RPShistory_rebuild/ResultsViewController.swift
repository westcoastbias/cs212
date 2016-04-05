//
//  ResultsViewController.swift
//  cs212_Homework6_RockPaperScissors
//
//  Created by Lucas Ruprecht on 2/25/16.
//  Copyright (c) 2016 Lucas Ruprecht. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet var label: UILabel!
    var output: String!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        //format label output
        label.lineBreakMode = NSLineBreakMode.ByWordWrapping
        label.numberOfLines = 2
        //product label output
        label.text = output
        
    }
    
    
    
}
