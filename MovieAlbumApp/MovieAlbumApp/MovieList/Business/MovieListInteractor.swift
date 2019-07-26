//
//  MovieListInteractor.swift
//  MovieAlbumApp
//
//  Created by Dinesh Reddy on 26/07/19.
//  Copyright © 2019 Dinesh Reddy. All rights reserved.
//

import Foundation

class MovieListInteractor {
    private let output: MovieListInteractorOutput
    private let networkController: MovieListNetworkController?
    init(presenter: MovieListInteractorOutput, networkController: MovieListNetworkController?) {
        self.output = presenter
        self.networkController = networkController
        self.networkController?.delegate = self
    }
    
    private func initiateMovieListFetch() {
        networkController?.initiateFetchingMovieList()
    }
}

extension MovieListInteractor: MovieListControllerDelegate {
    func updateMovieList(movieList: MovieList) {
        output.updateMovieList(movieList: movieList)
    }
    
    func updateServerError(error: Error) {
        output.updateServerError(errorMessage: error.localizedDescription)
    }
}

extension MovieListInteractor: MovieListInteractorInput {
    func fetchMovieList() {
        self.initiateMovieListFetch()
    }
}
