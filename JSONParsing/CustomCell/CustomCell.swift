//
//  CustomCell.swift
//  JSONParsing
//
//  Created by Varun Yadav on 10/11/17.
//  Copyright © 2017 Varun Yadav. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {

    
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var searchLabel: UILabel!
    
    @IBOutlet weak var searchImage: UIImageView!
    override func awakeFromNib() {
        
        super.awakeFromNib()
        
        containerView.layer.cornerRadius = 5.0
        containerView.layer.borderColor  =  UIColor.white.cgColor
        containerView.layer.borderWidth = 2.0
        containerView.layer.shadowOpacity = 1.5
        containerView.layer.shadowColor =  UIColor.lightGray.cgColor
        containerView.layer.shadowRadius = 4.0
        containerView.layer.shadowOffset = CGSize(width:0, height: 10)
        containerView.layer.masksToBounds = false
        containerView.layer.shadowPath = UIBezierPath(rect: containerView.bounds).cgPath
        containerView.backgroundColor = UIColor(red: 0.9373, green: 0.9882, blue: 1, alpha: 1.0)
        
//        containerView.layer.cornerRadius = 5.0
//        containerView.layer.borderWidth = 1.0
//        containerView.layer.borderColor = UIColor.clear.cgColor
//        containerView.layer.shadowColor = UIColor.lightGray.cgColor
//        containerView.layer.shadowRadius = 1.0
//        containerView.layer.shadowOpacity = 1.0
//        containerView.layer.shadowOffset = CGSize(width:0, height: 2)
//        containerView.layer.shadowPath = UIBezierPath(rect: containerView.bounds).cgPath
//
        
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
