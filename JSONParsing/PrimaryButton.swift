//
//  PrimaryButton.swift
//  JSONParsing
//
//  Created by Varun Yadav on 12/1/17.
//  Copyright © 2017 Varun Yadav. All rights reserved.
//

import Foundation
import SimpleButton

class PrimaryButton: SimpleButton {
    override func configureButtonStyles() {
        super.configureButtonStyles()
        setBorderWidth(4.0, for: .normal)
        setBackgroundColor(UIColor(red: 52/255, green: 73/255, blue: 94/255, alpha: 1.0), for: .normal)
        setBackgroundColor(UIColor(red: 44/255, green: 62/255, blue: 80/255, alpha: 1.0), for: .highlighted)
        setBorderColor(UIColor(red: 44/255, green: 62/255, blue: 80/255, alpha: 1.0), for: .normal)
        setScale(0.98, for: .highlighted)
        setTitleColor(UIColor.white, for: .normal)
    }
}
