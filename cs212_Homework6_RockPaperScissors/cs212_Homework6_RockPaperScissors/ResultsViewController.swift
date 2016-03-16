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
    var userThrow: String!
    var userThrowInt: Int!
    var computerThrow: String!
    var result: String!
    

    
    @IBAction func dismiss(sender: UIButton) {
        //dismiss button to go back to the R/P/S buttons
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        //generate computer throw between 0 - 2
        let computerThrowInt = Int(arc4random_uniform(3))
        
        //get computer throw string for display purposes
        if computerThrowInt == 0 {
            computerThrow = "Rock"
        } else if computerThrowInt == 1 {
            computerThrow = "Paper"
        } else {
            computerThrow = "Scissors"
        }
        
        //get user throw int for determining winner
        if userThrow == "Rock" {
            userThrowInt = 0
        } else if userThrow == "Paper" {
            userThrowInt = 1
        } else {
            userThrowInt = 2
        }
        
        //determine winner
        let diff = userThrowInt - computerThrowInt
        if diff == 0 {
            result = "Tie"
        } else if diff == 1 || diff == -2 {
            result = "Win!"
        } else {
            result = "Lose"
        }
        
        //format label output
        label.lineBreakMode = NSLineBreakMode.ByWordWrapping
        label.numberOfLines = 2
        //product label output
        label.text = "\(userThrow) vs \(computerThrow) \n You \(result)"

    }



}
