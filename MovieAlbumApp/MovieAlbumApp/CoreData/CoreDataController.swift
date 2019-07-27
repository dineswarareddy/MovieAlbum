//
//  CoreDataController.swift
//  MovieAlbumApp
//
//  Created by Dinesh Reddy on 27/07/19.
//  Copyright © 2019 Dinesh Reddy. All rights reserved.
//

import Foundation
import CoreData

protocol CoreDataControllerInput {
    func saveMovieInformation(_ movie: Movie)
    func fetchSavedMoviesList()
}

protocol CoreDataControllerOutput {
    func failedToSaveMovie()
    func updateMovieList(movieList: [MovieModelCoreData])
}

class CoreDataController {
    var delegate: CoreDataControllerOutput?
    let coreDataHandler = CoreDataHandler()
    
    private func saveMovie(_ movie: Movie) {
        let movieModel = MovieModelCoreData(originalTitle: movie.originalTitle, title: movie.title, overview: movie.overview, rating: movie.voteAverage, releaseDate: movie.releaseDate, movieImagePath: movie.posterPath)
        if !coreDataHandler.saveMovie(movieModel) {
            delegate?.failedToSaveMovie()
        }
    }
    
    private func fetchSavedMovies() {
        coreDataHandler.fetchMoviesList { (moviesList, error) -> (Void) in
            
            var movieDetails : [MovieModelCoreData] = []
            if let entityMovieList = moviesList {
                _ = entityMovieList.map({
                    let title = $0.value(forKey: CoreDataConstants.Attributs.title) as? String
                    let originalTitle = $0.value(forKey: CoreDataConstants.Attributs.originalTitle) as? String
                    let imagePath = $0.value(forKey: CoreDataConstants.Attributs.movieImage) as? String
                    let rating = $0.value(forKey: CoreDataConstants.Attributs.rating) as? Float
                    let overview = $0.value(forKey: CoreDataConstants.Attributs.overview) as? String
                    let releaseDate = $0.value(forKey: CoreDataConstants.Attributs.releaseDate) as? String
                    movieDetails.append(MovieModelCoreData(originalTitle: originalTitle, title: title, overview: overview, rating: rating, releaseDate: releaseDate, movieImagePath: imagePath))
                })
                self.delegate?.updateMovieList(movieList: movieDetails)
            }
        }
    }
}

extension CoreDataController: CoreDataControllerInput {
    func saveMovieInformation(_ movie: Movie) {
        saveMovie(movie)
    }
    
    func fetchSavedMoviesList() {
        fetchSavedMovies()
    }
}
