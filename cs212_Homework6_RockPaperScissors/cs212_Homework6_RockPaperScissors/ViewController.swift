//
//  ViewController.swift
//  cs212_Homework6_RockPaperScissors
//
//  Created by Lucas Ruprecht on 2/25/16.
//  Copyright (c) 2016 Lucas Ruprecht. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var userThrow: String!
    
    //function for clicking rock, done entirely in code
    @IBAction func clickRock(sender: UIButton) {
        //connect to the secondary controller in storyboard
        let controller = storyboard!.instantiateViewControllerWithIdentifier("ResultsViewController") as! ResultsViewController
        
        //set the userThrow on the new controller equal to the text on the button
        controller.userThrow = sender.titleLabel!.text
        
        //show the new controller, sans segue
        presentViewController(controller, animated: true, completion: nil)
    }
    
    //function for clicking paper, using the half & half approach
    @IBAction func clickPaper(sender: UIButton) {
        //execute the segue that was created in storyboard and tagged as Paper, send the button through so that value can be included as userThrow in prepareForSegue
        performSegueWithIdentifier("Paper", sender: sender)
    }
    
    //pass the value from the button over in the segue
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let controller = segue.destinationViewController as! ResultsViewController
        
        controller.userThrow = sender!.titleLabel!!.text

    }


}

