//
//  MovieListPresenterBoundaries.swift
//  MovieAlbumApp
//
//  Created by Dinesh Reddy on 26/07/19.
//  Copyright © 2019 Dinesh Reddy. All rights reserved.
//

import Foundation

public protocol MovieListPresenterInput {
    func fetchMovieList()
    func fetchSavedMoviesList()
}

public protocol MovieListPresenterOutput {
    func displayMovieList(_ movieList: [Movie])
    func displayError(_ errorMessage: String)
}
