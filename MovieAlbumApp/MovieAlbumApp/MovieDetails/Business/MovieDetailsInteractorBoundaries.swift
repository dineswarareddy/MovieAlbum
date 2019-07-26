//
//  MovieDetailsInteractorBoundaries.swift
//  MovieAlbumApp
//
//  Created by Dinesh Reddy on 26/07/19.
//  Copyright © 2019 Dinesh Reddy. All rights reserved.
//

import Foundation

protocol MovieDetailsInteractorInput {
    func showMovieDetails(_ movie: Movie)
}

protocol MovieDetailsInteractorOutput {
    func displayScreenTitle(_ title: String)
    func displayMovieImage(_ moviePosterPath: String)
    func displayMovieTitle(_ title: String)
    func displayMovieOverView(_ overview: String)
    func displayRating(_ rating: String)
    func displayMovieReleaseDate(_ releaseDate: String)
}

