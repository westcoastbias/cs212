//
//  ViewController.swift
//  segue_example
//
//  Created by Lucas Ruprecht on 2/23/16.
//  Copyright (c) 2016 Lucas Ruprecht. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var slider: UISlider!
    
    @IBAction func go(sender: UIButton) {
        //not used, since that button is all storyboard, no code
    }
    
    @IBAction func go2(sender: UIButton) {
        performSegueWithIdentifier("Go2", sender: nil)
    }
    
    @IBAction func go3(sender:UIButton) {
        let controller = storyboard!.instantiateViewControllerWithIdentifier("OtherViewController") as! OtherViewController
        
        controller.percentage = slider.value
        
        presentViewController(controller, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let controller = segue.destinationViewController as! OtherViewController
        
        controller.percentage = slider.value
    }


}

