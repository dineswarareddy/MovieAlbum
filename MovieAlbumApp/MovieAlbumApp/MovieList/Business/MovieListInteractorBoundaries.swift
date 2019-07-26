//
//  MovieListInteractorBoundaries.swift
//  MovieAlbumApp
//
//  Created by Dinesh Reddy on 26/07/19.
//  Copyright © 2019 Dinesh Reddy. All rights reserved.
//

import Foundation

protocol MovieListInteractorInput {
    func fetchMovieList()
}

protocol MovieListInteractorOutput {
    func updateMovieList(movieList: MovieList)
    func updateServerError(errorMessage: String)
}
