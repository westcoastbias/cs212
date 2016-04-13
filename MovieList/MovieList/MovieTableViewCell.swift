//
//  MovieTableViewCell.swift
//  MovieList
//
//  Created by Lucas Ruprecht on 4/12/16.
//  Copyright © 2016 Jason Schatz. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    var cellNumber: Int! {
        willSet(new) {
            if cellNumber == nil {
                cellNumber = new
            } else {
                cellNumber = cellNumber
            }
        }
    }
    
    var task: NSURLSessionTask? {
        willSet {
            if let task = task {
                task.cancel()
                print("cancel it")
            }
        }
    }
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
//
//    override func setSelected(selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }

}
