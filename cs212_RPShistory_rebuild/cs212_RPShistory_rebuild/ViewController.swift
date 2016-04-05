//
//  ViewController.swift
//  cs212_Homework6_RockPaperScissors
//
//  Created by Lucas Ruprecht on 2/25/16.
//  Copyright (c) 2016 Lucas Ruprecht. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var matches = [RPSMatch]()
    var userThrow: String!
    var computerThrow: String!
    var userThrowInt: Int!
    var result: String!
    var output: String!
    
    func calculateWinner() {
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
        
        output = "\(userThrow) vs \(computerThrow) - You \(result)"
        let match = RPSMatch(string: output)
        matches.insert(match, atIndex: 0)
    }
    
    
    //function for clicking rock, done entirely in code
    @IBAction func clickRock(sender: UIButton) {
        //connect to the secondary controller in storyboard
        userThrow = "Rock"
        calculateWinner()
        performSegueWithIdentifier("Rock", sender: sender)
    }
    
    //function for clicking paper, using the half & half approach
    @IBAction func clickPaper(sender: UIButton) {
        userThrow = "Paper"
        calculateWinner()
        performSegueWithIdentifier("Paper", sender: sender)
    }
    
    @IBAction func clickScissors(sender: UIButton) {
        userThrow = "Scissors"
        calculateWinner()
        performSegueWithIdentifier("Scissors", sender: sender)
    }
    
    //pass the result string over to the results view controller
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let controller = segue.destinationViewController as! ResultsViewController
        
        controller.output = output
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "History", style: .Plain, target: self, action: "showHistory")
    }
    
    func showHistory() {
        let controller = storyboard!.instantiateViewControllerWithIdentifier("HistoryTableViewController") as! HistoryTableViewController
        
        controller.matches = matches
        
        //show the new controller
        presentViewController(controller, animated: true, completion: nil)
        
    }
    
    
}



