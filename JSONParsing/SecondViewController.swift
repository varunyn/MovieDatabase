//
//  SecondViewController.swift
//  JSONParsing
//
//  Created by Varun Yadav on 10/11/17.
//  Copyright © 2017 Varun Yadav. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    var title1 = ""
    var descript = ""
    var votess: Double = 0
    var img: UIImage!
     var secondURL = ""
    @IBOutlet weak var label1: UILabel!
    
    @IBOutlet weak var descImage: UIImageView!
    
    @IBOutlet weak var Rating: UILabel!
    @IBOutlet weak var desc: UITextView!
    
  
    @IBOutlet weak var votes: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label1.text = title1
        desc.text = descript
        let imgURL = URL(string: secondURL)
        
        if imgURL == nil {
             descImage.image = #imageLiteral(resourceName: "No image found")
           
            
        }
        if imgURL != nil {
            do{
                let data = try Data.init(contentsOf: imgURL!)
            descImage.image = UIImage.init(data: data)
            }
            catch let error {
                print(error)
            }
        }
//        descImage.image = img
        votes.text = String(votess)
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
         title1 = ""
         descript = ""
        votess = 0
        img = nil
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   

}
