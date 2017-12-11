//
//  ViewController.swift
//  JSONParsing
//
//  Created by Varun Yadav on 10/11/17.
//  Copyright © 2017 Varun Yadav. All rights reserved.
//

import UIKit
import SimpleButton
//
//struct Response: Decodable {
//    let results: results
//}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   

   
  
    
   
    @IBOutlet weak var searchButton: UIButton!
    
    @IBOutlet weak var searchField: UITextField!
    @IBAction func Search(_ sender: Any) {
        
    }
     var titleArray = [String]()
    var imageArray = [String]()
    var desc = [String]()
    var imag = [UIImage]()
     var vote = [Double]()
    
    @IBOutlet weak var table: UITableView!
    @IBAction func button(_ sender: Any) {
        do{
           titleArray = [String]()
         
            imageArray = [String]()
            desc = [String]()
             imag = [UIImage]()
            vote = [Double]()
            
             let urlString = "https://api.themoviedb.org/3/search/movie?page=1&api_key=46871c03e2e48c603fde2052cc2e5e37&query="
            
            let addOn = searchField.text!
           
            let finalUrl = urlString + addOn
            
            let url = URL.init(string: finalUrl)
            
            let response = try Data.init(contentsOf: url!)
            var parsedData = try JSONSerialization.jsonObject(with: response, options: []) as! [String:Any]
            let results = parsedData["results"] as! [[String: Any]]

            for temp in results{
                let title = temp["title"] as! String
                titleArray.append(title)
                print(title)
                let image = temp["poster_path"] as? String
                
                if image == nil {
                    let imageUrl = ""
                     imageArray.append(imageUrl)
//                     print(imageUrl)
                } else{
                    let imageUrl = "https://image.tmdb.org/t/p/w500" + image!
                     imageArray.append(imageUrl)
//                     print(imageUrl)
                }
                let description = temp["overview"] as! String
                desc.append(description)
                let vote_avg = temp["vote_average"] as! Double
                vote.append(vote_avg)
                }

             table.reloadData()
            
        } catch let error {
            print(error)
        }

    }
    

    override func viewDidLoad() {

        super.viewDidLoad()
        table.register(UINib(nibName: "CustomCell", bundle: nil),forCellReuseIdentifier: "Cell")
         searchButton.layer.cornerRadius = 4
         self.hideKeyboardWhenTappedAround()
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomCell
        cell.searchLabel.text = titleArray[indexPath.row]
     //   cell.searchImage.image = imageArray[indexPath.row]
        
        let imgURL = URL(string: imageArray[indexPath.row])
        
        if imgURL == nil {
             cell.searchImage.image = #imageLiteral(resourceName: "No image found")
             imag.append(#imageLiteral(resourceName: "No image found"))
//            print()
        }
        if imgURL != nil {
            do{
            let data = try Data.init(contentsOf: imgURL!)
            cell.searchImage.image = UIImage.init(data: data)
                imag.append(UIImage.init(data: data)!)
            }
            catch let error {
                print(error)
            }
            }
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleArray.count
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let StoryBoard = UIStoryboard(name: "Main", bundle: nil)
        let SecondVC = StoryBoard.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
//       SecondVC.img = imag[indexPath.row]
       SecondVC.secondURL = imageArray[indexPath.row]
        SecondVC.title1 = titleArray[indexPath.row]
        SecondVC.descript = desc[indexPath.row]
        SecondVC.votess = Double(vote[indexPath.row])
        self.navigationController?.pushViewController(SecondVC, animated: true)
    }
    func configureTableView() {
       table.rowHeight = UITableViewAutomaticDimension
        table.estimatedRowHeight = 300.0
    }
}

