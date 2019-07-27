//
//  MovieDetailsPresenterBoundaries.swift
//  MovieAlbumApp
//
//  Created by Dinesh Reddy on 26/07/19.
//  Copyright © 2019 Dinesh Reddy. All rights reserved.
//

import Foundation

protocol MovieDetailsPresenterOutput {
    func updateScreenTitle(_ title: String)
    func updateMovieImage(_ imageURL: URL)
    func updateMovieTitle(_ title: String)
    func updateMovieOverView(_ overview: String)
    func updateRating(_ rating: String)
    func updateMovieReleaseDate(_ releaseDate: String)
}

protocol MovieDetailsPresenterInput {
    func showCurrentMovieDetails(_ currentMovie: Movie)
    func saveMovie(_ movie: Movie)
}
