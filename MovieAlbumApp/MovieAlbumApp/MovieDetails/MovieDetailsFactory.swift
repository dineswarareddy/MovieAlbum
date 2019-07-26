//
//  MovieDetailsFactory.swift
//  MovieAlbumApp
//
//  Created by Dinesh Reddy on 26/07/19.
//  Copyright © 2019 Dinesh Reddy. All rights reserved.
//

import Foundation

enum MovieDetailsModuleFactory {
    static func createMovieListFactory(view: MovieDetailsPresenterOutput?) -> MovieDetailsPresenterInput {
        let presenter = MovieDetailsPresenter(view: view)
        let interactor = MovieDetailsInteractor(presenter: presenter)
        presenter.view = view
        presenter.interactor = interactor
        return presenter
    }
}
