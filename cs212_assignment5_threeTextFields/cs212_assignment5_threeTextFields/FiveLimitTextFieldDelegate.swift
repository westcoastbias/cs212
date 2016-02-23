//
//  FiveLimitTextFieldDelegate.swift
//  cs212_assignment5_threeTextFields
//
//  Created by Lucas Ruprecht on 2/20/16.
//  Copyright (c) 2016 Lucas Ruprecht. All rights reserved.
//

import Foundation
import UIKit

class FiveLimitTextFieldDelegate : NSObject, UITextFieldDelegate {
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        //stores length of text in textField
        let charCount = count(textField.text!)
        //if there are five or more characters and the key typed isn't delete, don't allow editing
        if charCount >= 5 && string != "" {
            return false
        }
        
        //otherwise, allow editing
        return true
    }
    
}