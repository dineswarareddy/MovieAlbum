//
//  MovieDetailsInteractor.swift
//  MovieAlbumApp
//
//  Created by Dinesh Reddy on 26/07/19.
//  Copyright © 2019 Dinesh Reddy. All rights reserved.
//

import Foundation

class MovieDetailsInteractor {
    private let output: MovieDetailsInteractorOutput
    private let coreDataController: CoreDataController?
    init(presenter: MovieDetailsInteractorOutput, coredataController: CoreDataController?) {
        self.output = presenter
        self.coreDataController = coredataController
    }
}

extension MovieDetailsInteractor: MovieDetailsInteractorInput {
    func saveMovie(_ movie: Movie) {
        coreDataController?.saveMovieInformation(movie)
    }
    
    func showMovieDetails(_ movie: Movie) {
        if let imagePath = movie.posterPath {
            output.displayMovieImage(imagePath)
        }
        if let releaseDate = movie.releaseDate {
            output.displayMovieReleaseDate(releaseDate)
        }
        if let rating = movie.voteAverage {
            output.displayRating(String(rating))
        }
        if let originalTitle = movie.originalTitle {
            output.displayMovieTitle(originalTitle)
        }
        if let title = movie.title {
            output.displayScreenTitle(title)
        }
        if let overView = movie.overview {
            output.displayMovieOverView(overView)
        }
    }
}

extension MovieDetailsInteractor: CoreDataControllerOutput {
    func failedToSaveMovie() {
        print("Failed to save data")
    }
    
    func updateMovieList(movieList: [MovieModelCoreData]) {
        // No need of implementation it has to handle under movie list view controller.
    }
}

