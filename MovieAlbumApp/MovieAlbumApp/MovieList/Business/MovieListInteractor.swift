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
    private let coreDataController: CoreDataController?
    
    init(presenter: MovieListInteractorOutput, networkController: MovieListNetworkController?, coreDataController: CoreDataController?) {
        self.output = presenter
        self.networkController = networkController
        self.coreDataController = coreDataController
        self.coreDataController?.delegate = self
        self.networkController?.delegate = self
    }
    
    private func initiateMovieListFetch() {
        networkController?.initiateFetchingMovieList()
    }
}

extension MovieListInteractor: MovieListControllerDelegate {
    func updateMovieList(movieList: [Movie]) {
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
    
    func fetchSavedMoviesList() {
        coreDataController?.fetchSavedMoviesList()
    }
}

extension MovieListInteractor: CoreDataControllerOutput {
    func failedToSaveMovie() {
        // Not required here as we don't have feature to save movie in details screen
    }
    
    func updateMovieList(movieList: [MovieModelCoreData]) {
        var outputMovieList: [Movie] = []
        _ = movieList.map({
            outputMovieList.append(Movie(voteCount: 0, id: 0, video: false, voteAverage: 0, title: $0.title, popularity: 0, posterPath: "", originalLanguage: "", originalTitle: $0.originalTitle, genreIds: [], backdropPath: "", adult: false, overview: $0.overview, releaseDate: $0.releaseDate))
        })
        output.updateMovieList(movieList: outputMovieList)
    }
}
