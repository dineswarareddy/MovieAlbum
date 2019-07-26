//
//  MovieListViewController.swift
//  MovieAlbumApp
//
//  Created by Dinesh Reddy on 26/07/19.
//  Copyright © 2019 Dinesh Reddy. All rights reserved.
//

import UIKit

class MovieListViewController: UIViewController {
    
    fileprivate enum CellIdentifiers {
        static let movieCell = "MovieInformationTableViewCell"
    }
    
    @IBOutlet private weak var movieListTableView: UITableView?
    var movieList: [Movie]?
    var presenter: MovieListPresenterInput?
    var selectedMovieToDisplay: Movie?
    var router: MovieListRouter?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        presenter = MovieListModuleFactory.createMovieListFactory(view: self)
        MovieListModuleFactory.configureRouter(viewController: self)
        presenter?.fetchMovieList()
    }
}

extension MovieListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        selectedMovieToDisplay = movieList?[indexPath.row]
        performSegue(withIdentifier: Constants.Segues.movieDetailPageSegue, sender: nil)
    }
}

extension MovieListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.movieCell, for: indexPath) as? MovieInformationTableViewCell else { return UITableViewCell() }
        if let movie = movieList?[indexPath.row] {
            cell.setupMovieInformation(from: movie)
        }
        return cell
    }
}


extension MovieListViewController: MovieListPresenterOutput {
    func displayMovieList(_ movieList: MovieList) {
        self.movieList = movieList.results
        movieListTableView?.reloadData()
    }
    
    func displayError(_ errorMessage: String) {
        // TODO: Display error banner message
    }
}
