//
//  Movie.swift
//  Flix
//
//  Created by Annabel Strauss on 7/3/17.
//  Copyright © 2017 Annabel Strauss. All rights reserved.
//

import Foundation

class Movie {
    
    var title: String
    var overview: String
    var posterURL: URL?
    var releaseDate: String
    var backdropURL: URL?
    
    
    
    init(dictionary: [String: Any]) {
        title = dictionary["title"] as? String ?? "No title"
        overview = dictionary["overview"] as? String ?? "No overview"
        releaseDate = dictionary["release_date"] as? String ?? "no release date"
        
        let baseURLString = "https://image.tmdb.org/t/p/w500"
        let posterPathString = dictionary["poster_path"] as! String
        posterURL = URL(string: baseURLString + posterPathString)!
        if let backDropPath = dictionary["backdrop_path"] as? String {
            backdropURL = URL(string: baseURLString + backDropPath)!
        }
        
    }
    
    class func movies(dictionaries: [[String: Any]]) -> [Movie] {
        var movies: [Movie] = []
        for dictionary in dictionaries {
            let movie  = Movie(dictionary: dictionary)
            movies.append(movie)
        }
        return movies
    }
    
    
    
    
}//close class
