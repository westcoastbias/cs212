//
//  ViewController.swift
//  Navigation_inClass_Practice
//
//  Created by Lucas Ruprecht on 3/1/16.
//  Copyright (c) 2016 Lucas Ruprecht. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func clickRock(sender: UIButton) {
        //connect to the secondary controller in storyboard
        let controller = storyboard!.instantiateViewControllerWithIdentifier("ResultsViewController") as! ResultsViewController
        //set the userThrow on the new controller equal to the text on the button
        controller.userThrow = "Rock"
        //show the new controller, sans segue
        self.navigationController!.pushViewController(controller, animated: true)
    }
    
    @IBAction func clickScissors(sender: UIButton) {
        performSegueWithIdentifier("Scissors", sender: sender)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let controller = segue.destinationViewController as! ResultsViewController
        controller.userThrow = segue.identifier!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Move"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "History", style: .Plain, target: self, action: "showHistory")
    }
    
    func showHistory() {
        print("history")
    }


}

