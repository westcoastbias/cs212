//
//  ViewController.swift
//  cs212_assignment5_threeTextFields
//
//  Created by Lucas Ruprecht on 2/20/16.
//  Copyright (c) 2016 Lucas Ruprecht. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    // Outlets
    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField2: UITextField!
    @IBOutlet weak var textField3: UITextField!
    @IBOutlet weak var switch3: UISwitch!
    
    // Text Field Delegate objects
    let fiveLimitDelegate = FiveLimitTextFieldDelegate()
    let dollarFormatDelegate = DollarFormatTextFieldDelegate()
    
    // Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the three delegates
        self.textField1.delegate = fiveLimitDelegate
        self.textField2.delegate = dollarFormatDelegate
        self.textField3.delegate = self
        self.textField2.text = "$0.00"
    }

    // Text Field Delegate Methods
    //stops the user from clicking into the text field when the switch is OFF
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        return self.switch3.on
    }
    
    //stops new characters from being added to the text field when the switch is OFF
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        return self.switch3.on
    }
    
}

