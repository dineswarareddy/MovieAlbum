//
//  MovieDetailsViewController.swift
//  MovieAlbumApp
//
//  Created by Dinesh Reddy on 26/07/19.
//  Copyright © 2019 Dinesh Reddy. All rights reserved.
//

import UIKit

class MovieDetailsViewController: UIViewController {
    @IBOutlet private weak var movieImageView: UIImageView?
    @IBOutlet private weak var releaseDateLabel: UILabel?
    @IBOutlet private weak var movieRatingLabel: UILabel?
    @IBOutlet private weak var movieTitleLabel: UILabel?
    @IBOutlet private weak var movieDescriptionLabel: UILabel?
    
    var currentMovie: Movie?
    
    var presenter: MovieDetailsPresenterInput?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = MovieDetailsModuleFactory.createMovieListFactory(view: self)
        if let movie = currentMovie {
            presenter?.showCurrentMovieDetails(movie)
        }
        // Do any additional setup after loading the view.
    }
}

extension MovieDetailsViewController: MovieDetailsPresenterOutput {
    func updateScreenTitle(_ title: String) {
        self.navigationItem.title = title
    }
    
    func updateMovieImage(_ imageURL: URL) {
        movieImageView?.imageFromServerURL(imageURL)
    }
    
    func updateMovieTitle(_ title: String) {
        movieTitleLabel?.text = title
    }
    
    func updateMovieOverView(_ overview: String) {
        movieDescriptionLabel?.text = overview
    }
    
    func updateRating(_ rating: String) {
        movieRatingLabel?.text = rating
    }
    
    func updateMovieReleaseDate(_ releaseDate: String) {
        releaseDateLabel?.text = releaseDate
    }
}
