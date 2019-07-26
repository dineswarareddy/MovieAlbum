//
//  MovieListPresenter.swift
//  MovieAlbumApp
//
//  Created by Dinesh Reddy on 26/07/19.
//  Copyright © 2019 Dinesh Reddy. All rights reserved.
//

import Foundation

final class MovieListPresenter {
    var interactor: MovieListInteractorInput?
    var view: MovieListPresenterOutput?
    init(view: MovieListPresenterOutput?) {
        self.view = view
    }
}

extension MovieListPresenter: MovieListPresenterInput {
    func fetchMovieList() {
        interactor?.fetchMovieList()
    }
}

extension MovieListPresenter: MovieListInteractorOutput {
    func updateMovieList(movieList: MovieList) {
        view?.displayMovieList(movieList)
    }
    
    func updateServerError(errorMessage: String) {
        view?.displayError(errorMessage)
    }
}
