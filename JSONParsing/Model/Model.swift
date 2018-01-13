//
//  Model.swift
//  JSONParsing
//
//  Created by Varun Yadav on 1/11/18.
//  Copyright © 2018 Varun Yadav. All rights reserved.
//

import Foundation


class MovResults {
    let vote_count : Int?
    let id : Int?
    let vote_average : Double?
    let title : String?
    let popularity : Double?
    let poster_path : String?
    let original_title : String?
    let overview : String?
    let release_date : String?
    let backdrop_path: String?
    
    init(vote_count : Int?,
    id : Int?,
    vote_average : Double?,
    title : String?,
    popularity : Double?,
    poster_path : String?,
    original_title : String?,
    overview : String?,
    release_date : String?,
    backdrop_path: String?) {
        
        self.vote_count = vote_count
        self.id = id
        self.vote_average  = vote_average
        self.title = title
        self.popularity = popularity
        self.poster_path = poster_path
        self.original_title = original_title
        self.overview = overview
        self.release_date = release_date
        self.backdrop_path = backdrop_path
      
    }
    
}

