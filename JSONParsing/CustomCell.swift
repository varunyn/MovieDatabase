//
//  CustomCell.swift
//  JSONParsing
//
//  Created by Varun Yadav on 10/11/17.
//  Copyright © 2017 Varun Yadav. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {

    
    @IBOutlet weak var searchLabel: UILabel!
    
    @IBOutlet weak var searchImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
