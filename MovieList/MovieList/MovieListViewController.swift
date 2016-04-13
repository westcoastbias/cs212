//
//  MovieListViewController.swift
//  MovieList
//
//  Created by ccsfcomputers on 10/29/15.
//  Copyright (c) 2015 Jason Schatz. All rights reserved.
//

import UIKit

class MovieListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var movies: [Movie] = [Movie]()
    
    // This will store out task for downloading movies.
    var task: NSURLSessionTask?
    
    // Here we make a queue that is guaranteed to execute blocks one at a time
    var serialQueue = dispatch_queue_create("MovieListViewController.SerialQueue", DISPATCH_QUEUE_SERIAL)
    
    
    // MARK: - Search Task
    
    func taskForMoviesWithQuerry(querry: String) -> NSURLSessionTask {
    
        let parameters = ["query" : querry]
        
        let url = TMDBURLs.URLForResource(TMDB.Resources.SearchMovie, parameters: parameters)
        
        print(url)

        let task = NSURLSession.sharedSession().dataTaskWithURL(url) { data, response, error in
            
            // Error
            if let error = error {print(error);return}

            // Data
            if let data = data {
               self.movies = self.moviesFromData(data)
            
               dispatch_async(dispatch_get_main_queue()) {
                   self.tableView.reloadData()
               }
            }
            
        }
        
        return task
    }
    
    
    // MARK: - Search Bar Delegate
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        
        dispatch_async(serialQueue) {
            
            if let task = self.task {
                task.cancel()
            }
            
            if searchText.isEmpty {
                self.task = nil
                self.movies = [Movie]()
                
                dispatch_async(dispatch_get_main_queue()) {
                    self.tableView.reloadData()
                }
            } else {
                self.task = self.taskForMoviesWithQuerry(searchText)
                self.task!.resume()
            }
        }
    }
    
    
    // MARK: - Toggle UI while downloading
    
    func setUIToDownloading(isDownloading: Bool) {
        
        if isDownloading {
            self.activityIndicator.startAnimating()
        } else {
            self.activityIndicator.stopAnimating()
        }
        
        self.activityIndicator.hidden = isDownloading
        self.tableView.alpha = isDownloading ? 0.2 : 1.0
    }
    
    // MARK: - Table View
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell") as! MovieTableViewCell
        
        var movie = movies[indexPath.row]
        
        cell.textLabel!.text = movie.title
        
        if movie.posterPath == nil {
            cell.imageView!.image = UIImage(named: "noImage")
        }
        //set placeholder for image
        
        else if let image = movie.posterImage {
        cell.imageView!.image = image
        } else {
            cell.imageView!.image = UIImage(named: "placeHolder")
        
            //start downloading image
            //get url
            let url = TMDBURLs.URLForPosterWithPath(movie.posterPath!)
            //create task
            let task = NSURLSession.sharedSession().dataTaskWithURL(url) {
                
                data, response, error in

                if let error = error {
                    print(error)
                }
                
                //turn data into image
                if let data = data {
                    let image = UIImage(data: data)
                    movie.posterImage = image
                    dispatch_async(dispatch_get_main_queue()) {
                    //set image as cell imageView
                    cell.imageView!.image = image
                    }
                }
            }
            //resume task
            print(cell.cellNumber)
            cell.task = task
            task.resume()
        }
        return cell
    }
    
    // MARK: - Parser
    
    func moviesFromData(data: NSData) -> [Movie] {
        // Parse the Data into a JSON Object
        let JSONObject = try? NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions(rawValue: 0))
        
        // Insist that this object must be a dictionary
        guard let JSONDictionary = JSONObject as? [String : AnyObject] else {
            assertionFailure("Failed to parse data. data.length: \(data.length)")
            return [Movie]()
        }
        
        // Print the object, for now, so we can take a look
        let movieDictionaries = JSONDictionary["results"] as! [[String: AnyObject]]
        
        var movies = [Movie]()
        
        for d in movieDictionaries {
            movies.append(Movie(dictionary: d))
        }
        
        /**
            the for/in could also be written as
        movies = movieDictionaries.map() { Movie(dictionary: $0) }
        
        or
        
        movies = movieDictionaries.map({
            d in return Movie(dictionary: d)
        })
        */
        
        return movies
    }
}
