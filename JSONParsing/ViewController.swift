//
//  ViewController.swift
//  JSONParsing
//
//  Created by Varun Yadav on 10/11/17.
//  Copyright © 2017 Varun Yadav. All rights reserved.
//

import UIKit
import SimpleButton
import Kingfisher

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

struct MovieResults : Codable {
    let page : Int?
    let total_results : Int?
    let total_pages : Int?
    let results : [Results]?
    
    enum CodingKeys: String, CodingKey {
        
        case page = "page"
        case total_results = "total_results"
        case total_pages = "total_pages"
        case results = "results"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        page = try values.decodeIfPresent(Int.self, forKey: .page)
        total_results = try values.decodeIfPresent(Int.self, forKey: .total_results)
        total_pages = try values.decodeIfPresent(Int.self, forKey: .total_pages)
        results = try values.decodeIfPresent([Results].self, forKey: .results)
    }
    
}
struct Results : Codable {
    let vote_count : Int?
    let id : Int?
    let video : Bool?
    let vote_average : Double?
    let title : String?
    let popularity : Double?
    let poster_path : String?
    let original_language : String?
    let original_title : String?
    let genre_ids : [Int]?
    let backdrop_path : String?
    let adult : Bool?
    let overview : String?
    let release_date : String?
    
    enum CodingKeys: String, CodingKey {
        
        case vote_count = "vote_count"
        case id = "id"
        case video = "video"
        case vote_average = "vote_average"
        case title = "title"
        case popularity = "popularity"
        case poster_path = "poster_path"
        case original_language = "original_language"
        case original_title = "original_title"
        case genre_ids = "genre_ids"
        case backdrop_path = "backdrop_path"
        case adult = "adult"
        case overview = "overview"
        case release_date = "release_date"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        vote_count = try values.decodeIfPresent(Int.self, forKey: .vote_count)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        video = try values.decodeIfPresent(Bool.self, forKey: .video)
        vote_average = try values.decodeIfPresent(Double.self, forKey: .vote_average)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        popularity = try values.decodeIfPresent(Double.self, forKey: .popularity)
        poster_path = try values.decodeIfPresent(String.self, forKey: .poster_path)
        original_language = try values.decodeIfPresent(String.self, forKey: .original_language)
        original_title = try values.decodeIfPresent(String.self, forKey: .original_title)
        genre_ids = try values.decodeIfPresent([Int].self, forKey: .genre_ids)
        backdrop_path = try values.decodeIfPresent(String.self, forKey: .backdrop_path)
        adult = try values.decodeIfPresent(Bool.self, forKey: .adult)
        overview = try values.decodeIfPresent(String.self, forKey: .overview)
        release_date = try values.decodeIfPresent(String.self, forKey: .release_date)
    }
    
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchControllerDelegate, UISearchBarDelegate, UITextFieldDelegate {
    
   
    var images = [UIImage]()
    
    var count = 0
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        
        do{
            let group = DispatchGroup()
            group.enter()
            
            images = [UIImage]()
            
            count = 0
            
            MovieDetails = [MovResults]()
            
            let urlString = "https://api.themoviedb.org/3/search/movie?page=1&api_key=46871c03e2e48c603fde2052cc2e5e37&query="
            
            let addOn = searchBar.text!.replacingOccurrences(of: " ", with: "%20")
            
            let finalUrl = urlString + addOn
            
            let url = URL.init(string: finalUrl)
            
            print(addOn," url herE")
            
            let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
                
                guard let data = data else {return}
                
                do{
                    let jsonDecoder = JSONDecoder()
                    let responseModel = try jsonDecoder.decode(MovieResults.self, from: data)
                    
                    if responseModel.results?.count != nil {
                    
                    for i in 0...((responseModel.results?.count)!-1) {
                        
                        self.count += 1
                        
                        self.MovieDetails.append(MovResults(vote_count : responseModel.results?[i].vote_count,
                                                            id : responseModel.results?[i].id,
                                                            vote_average : responseModel.results?[i].vote_average,
                                                            title : responseModel.results?[i].title,
                                                            popularity : responseModel.results?[i].popularity,
                                                            poster_path : responseModel.results?[i].poster_path,
                                                            original_title : responseModel.results?[i].original_title,
                                                            overview : responseModel.results?[i].overview,
                                                            release_date : responseModel.results?[i].release_date,
                                                            backdrop_path:  responseModel.results?[i].backdrop_path ))
                        
                        }
                    }
                }
                catch let error {
                    print("Error found in catch")
                    print(error)
                }
                group.leave()
            }
            task.resume()
            
            
            group.notify(queue: DispatchQueue.main, execute: {
                
                if self.MovieDetails.count == self.count {
                    self.table.reloadData()
                }
                
            })
            
        }
    }
    
    @objc func showSearch () {
        self.navigationItem.searchController = search
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationItem.searchController?.searchBar.delegate = self
        search.obscuresBackgroundDuringPresentation = false
        search.isActive = true
    }

    var MovieDetails = [MovResults]()
    
    @IBOutlet weak var table: UITableView!
    
    let search = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        
        
        
        
  
        search.delegate = self

        showSearch()
        
        super.viewDidLoad()
        table.register(UINib(nibName: "CustomCell", bundle: nil),forCellReuseIdentifier: "Cell")
        self.hideKeyboardWhenTappedAround()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
//    func didPresentSearchController(_ searchController: UISearchController){
//        searchController.searchBar.becomeFirstResponder();
//    }
//
//    func willDismissSearchController(_ searchController: UISearchController) {
//        self.navigationItem.searchController = nil
//    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomCell
        cell.searchLabel.text = MovieDetails[indexPath.row].title
        
        let posterURL = "https://image.tmdb.org/t/p/w500"
        
        let imagePath = self.MovieDetails[indexPath.row].poster_path
        
        if imagePath != nil {
        let finalPath = posterURL + imagePath!
        
        let url = URL.init(string: finalPath)
        
        cell.searchImage.kf.setImage(with: url)
        }
        else {
              cell.searchImage.image =  #imageLiteral(resourceName: "No image found")
        }

        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("tableview count")
       print(images.count)
        if MovieDetails.count > 0 {
            return MovieDetails.count
        }
        return 0
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let StoryBoard = UIStoryboard(name: "Main", bundle: nil)

        let SecondVC = StoryBoard.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController

        if MovieDetails[indexPath.row].poster_path != nil{
             SecondVC.secondURL = MovieDetails[indexPath.row].poster_path!
          
        }
        
        if MovieDetails[indexPath.row].backdrop_path != nil{
              SecondVC.thirdURL = MovieDetails[indexPath.row].backdrop_path!
        }

        SecondVC.title1 = MovieDetails[indexPath.row].title!
        SecondVC.descript = MovieDetails[indexPath.row].overview!
        SecondVC.votess = Double(MovieDetails[indexPath.row].vote_average!)
        
        if MovieDetails[indexPath.row].release_date != nil{
        SecondVC.releaseDate =  MovieDetails[indexPath.row].release_date!
        }
        
      
        
        self.navigationController!.pushViewController(SecondVC, animated: true)
        
    }
    
    func configureTableView() {
        table.rowHeight = UITableViewAutomaticDimension
        table.estimatedRowHeight = 300.0
    }
    
}

