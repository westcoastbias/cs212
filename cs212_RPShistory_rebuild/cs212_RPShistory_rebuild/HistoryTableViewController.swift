//
//  HistoryTableViewController.swift
//  cs212_Homework6_RockPaperScissors
//
//  Created by Lucas Ruprecht on 3/25/16.
//  Copyright © 2016 Lucas Ruprecht. All rights reserved.
//

import UIKit

class HistoryTableViewController: UITableViewController {
    
    var matches = [RPSMatch]()
    
    @IBAction func dismiss(sender: UIButton) {
        //dismiss button to go back to the R/P/S buttons
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return matches.count + 1
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //unless it's the last row, show the regular cell with the outcome of the match
        if indexPath.row < matches.count {
            let cell = tableView.dequeueReusableCellWithIdentifier("HistoryTableViewCell", forIndexPath: indexPath) as! HistoryTableViewCell
            let matchLabelText = matches[indexPath.row].value
            cell.matchLabel.text = matchLabelText
            
            return cell
        } else {
            //if it's the last cell, show the dismiss cell with the button to go back to the game
            let cell = tableView.dequeueReusableCellWithIdentifier("DismissTableViewCell") as! DismissTableViewCell
            return cell
        }

    }

}
