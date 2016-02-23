//
//  DollarFormatTextFieldDelegate.swift
//  cs212_assignment5_threeTextFields
//
//  Created by Lucas Ruprecht on 2/20/16.
//  Copyright (c) 2016 Lucas Ruprecht. All rights reserved.
//

import Foundation
import UIKit

class DollarFormatTextFieldDelegate : NSObject, UITextFieldDelegate {
    
    //create a string to hold user input
    var holdingString = ""
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        //if the user types a number, move it into the holding string
        if string.toInt() >= 0 && string.toInt() <= 9 {
            self.holdingString += string
        }
        
        //if the user types delete, remove the last character from the holding string, as long as there are characters in the string to delete
        if string == "" && count(self.holdingString) != 0 {
            self.holdingString.removeAtIndex(self.holdingString.endIndex.predecessor())
        }
        
        //format the user's input to the desired $ format
        switch count(self.holdingString) {
            //user hasn't typed anything, display $0.00
        case 0:
            textField.text = "$0.00"
            //user has typed one character, precede it with $0.0
        case 1:
            textField.text = "$0.0" + self.holdingString
            //user has typed two characters, precede it with $0.
        case 2:
            textField.text = "$0." + self.holdingString
            //otherwise, no leading zeroes, just start with $ and split the string appropriately around the .
        default:
            let leftOfDecimal = (self.holdingString as NSString).substringToIndex(count(self.holdingString) - 2)
            let rightOfDecimal = (self.holdingString as NSString).substringFromIndex(count(self.holdingString) - 2)
            textField.text = "$" + leftOfDecimal + "." + rightOfDecimal
        }
        
        //always return false, since we'll handle the manipulating of the field in this function
        return false
        
    }
    

}
