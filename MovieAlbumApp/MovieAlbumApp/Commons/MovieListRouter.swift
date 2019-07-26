//
//  MovieListRouter.swift
//  MovieAlbumApp
//
//  Created by Dinesh Reddy on 26/07/19.
//  Copyright © 2019 Dinesh Reddy. All rights reserved.
//

import Foundation
import UIKit

final class MovieListRouter {
    weak var viewController: MovieListViewController?
    func passDataToNextScene(segue: UIStoryboardSegue) {
        // NOTE: Teach the router which scenes it can communicate with
        
        if segue.identifier == Constants.Segues.movieDetailPageSegue {
            passDataToMovieDetailsScene(segue: segue)
        }
    }
    func passDataToMovieDetailsScene(segue: UIStoryboardSegue) {
        // NOTE: Teach the router how to pass data to the next scene
        
        if let movieDetailsViewController = segue.destination as? MovieDetailsViewController {
            movieDetailsViewController.currentMovie = viewController?.selectedMovieToDisplay
        }
    }
}
