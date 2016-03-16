//
//  ViewController.swift
//  ChooseYourOwnAdventure
//
//  Created by Lucas Ruprecht on 3/9/16.
//  Copyright (c) 2016 Lucas Ruprecht. All rights reserved.
//

import UIKit

class StoryNodeViewController: UIViewController {

    @IBOutlet var Top: UIButton!
    @IBOutlet var Bottom: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Start Over", style: .Plain, target: self, action: "startOver")
    }
    
    @IBAction func clickButton (sender: UIButton) {
        var segue: String = ""
        var curPage: String! = self.restorationIdentifier
        switch curPage {
            case "Page1":
                if sender == Top {
                    segue = "Page1ToPage2"
                } else {
                    segue = "Page1ToPage3"
                }
            case "Page2":
                if sender == Top {
                    segue = "Page2ToPage4"
                } else {
                    segue = "Page2ToPage5"
                }
            case "Page3":
                if sender == Top {
                    segue = "Page3ToPage5"
                } else {
                    segue = "Page3ToPage6"
                }
            case "Page4":
                if sender == Top {
                    segue = "Page4ToPage7"
                } else {
                    segue = "Page4ToPage8"
                }
            case "Page5":
                if sender == Top {
                    segue = "Page5ToPage8"
                } else {
                    segue = "Page5ToPage9"
                }
            case "Page6":
                if sender == Top {
                    segue = "Page6ToPage9"
                } else {
                    segue = "Page6ToPage10"
            }
            default:
                segue = "Invalid Segue"
        }
        performSegueWithIdentifier(segue, sender: sender)
    }
    
    func startOver() {
        let controller: StoryNodeViewController = self.navigationController!.viewControllers[0] as! StoryNodeViewController
        self.navigationController!.viewControllers = [controller]
    }


}

