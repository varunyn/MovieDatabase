//
//  SecondViewController.swift
//  JSONParsing
//
//  Created by Varun Yadav on 10/11/17.
//  Copyright © 2017 Varun Yadav. All rights reserved.
//

import UIKit
import Kingfisher

class SecondViewController: UIViewController {

    var title1 = ""
    var descript = ""
    var votess: Double = 0
    var img: UIImage!
    var secondURL = ""
    var releaseDate = ""
    var thirdURL = ""
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var backDropImage: UIImageView!
    
    @IBOutlet weak var posterImage: UIImageView!
    
    
    @IBOutlet weak var Rating: UILabel!
    
    @IBOutlet weak var desc: UITextView!
    
    @IBOutlet weak var votes: UILabel!
    
    @IBOutlet weak var yearLabel: UILabel!
    override func viewDidLoad() {
        
        super.viewDidLoad()
//
//           self.navigationController?.navigationBar.barTintColor = UIColor.black
//        let textAttributes = [NSAttributedStringKey.foregroundColor:UIColor.white]
//        navigationController?.navigationBar.titleTextAttributes = textAttributes
        
        navigationController?.isNavigationBarHidden = false
        
        titleLabel.text = title1
        desc.text = descript

        yearLabel.text = String(releaseDate.prefix(4))

        let posterURL = "https://image.tmdb.org/t/p/w500"
        
        let imagePath = secondURL
        
        let backDropPath = thirdURL
        
        let backDropUrl = posterURL + backDropPath
        let url1 = URL.init(string: backDropUrl)
        backDropImage.kf.setImage(with: url1)
        
        let finalPath = posterURL + imagePath
        let url = URL.init(string: finalPath)
        posterImage.kf.setImage(with: url)
      
    votes.text = String(votess)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
         title1 = ""
         descript = ""
        votess = 0
        img = nil
//        releaseDate = ""
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   

}
