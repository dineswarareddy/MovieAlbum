//
//  MovieDetailsPresenter.swift
//  MovieAlbumApp
//
//  Created by Dinesh Reddy on 26/07/19.
//  Copyright © 2019 Dinesh Reddy. All rights reserved.
//

import Foundation

class MovieDetailsPresenter {
    var interactor: MovieDetailsInteractorInput?
    var view: MovieDetailsPresenterOutput?
    init(view: MovieDetailsPresenterOutput?) {
        self.view = view
    }
}

extension MovieDetailsPresenter: MovieDetailsPresenterInput {
    func showCurrentMovieDetails(_ currentMovie: Movie) {
        interactor?.showMovieDetails(currentMovie)
    }
}

extension MovieDetailsPresenter: MovieDetailsInteractorOutput {
    func displayMovieImage(_ moviePosterPath: String) {
        let imageURL = ImageULRConstructor.constructImageURL(imagePath: moviePosterPath)
        view?.updateMovieImage(imageURL)
    }
    
    func displayScreenTitle(_ title: String) {
        view?.updateScreenTitle(title)
    }
    
    func displayMovieTitle(_ title: String) {
        view?.updateMovieTitle(title)
    }
    
    func displayMovieOverView(_ overview: String) {
        view?.updateMovieOverView(overview)
    }
    
    func displayRating(_ rating: String) {
        view?.updateRating("Rating: \(rating)")
    }
    
    func displayMovieReleaseDate(_ releaseDate: String) {
        view?.updateMovieReleaseDate("Release Date: \(releaseDate)")
    }
}
