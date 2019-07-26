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
    init(presenter: MovieDetailsInteractorOutput) {
        self.output = presenter
    }
}

extension MovieDetailsInteractor: MovieDetailsInteractorInput {
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

