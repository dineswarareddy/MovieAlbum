//
//  MovieListTableViewCell.swift
//  MovieAlbumApp
//
//  Created by Dinesh Reddy on 26/07/19.
//  Copyright © 2019 Dinesh Reddy. All rights reserved.
//

import UIKit

class MovieInformationTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var movieImageView: UIImageView?
    @IBOutlet private weak var movieTitleLabel: UILabel?
    @IBOutlet private weak var movieOverviewLabel: UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupMovieInformation(from movie: Movie) {
        if let posterPath = movie.posterPath {
            let imageURL = ImageULRConstructor.constructImageURL(imagePath: posterPath)
            self.movieImageView?.imageFromServerURL(imageURL)
        }
        self.movieTitleLabel?.text =  movie.title
        self.movieOverviewLabel?.text = movie.overview
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
