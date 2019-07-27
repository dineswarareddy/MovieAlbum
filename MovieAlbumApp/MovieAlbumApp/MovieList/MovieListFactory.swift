//
//  MovieListFactory.swift
//  MovieAlbumApp
//
//  Created by Dinesh Reddy on 26/07/19.
//  Copyright © 2019 Dinesh Reddy. All rights reserved.
//

import Foundation
import UIKit

enum MovieListModuleFactory {
    static func createMovieListFactory(view: MovieListPresenterOutput?) -> MovieListPresenterInput {
        let networkController = MovieListNetworkController()
        let coreDataController = CoreDataController()
        let presenter = MovieListPresenter(view: view)
        let interactor = MovieListInteractor(presenter: presenter, networkController: networkController, coreDataController: coreDataController)
        presenter.view = view
        presenter.interactor = interactor
        return presenter
    }
    
    static func configureRouter(viewController: MovieListViewController) {
        let router = MovieListRouter()
        router.viewController = viewController
        viewController.router = router
    }
}

extension MovieListViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        router?.passDataToNextScene(segue: segue)
    }
}
