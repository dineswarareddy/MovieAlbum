//
//  MovieListModel.swift
//  MovieAlbumApp
//
//  Created by Dinesh Reddy on 26/07/19.
//  Copyright © 2019 Dinesh Reddy. All rights reserved.
//

import Foundation

public struct MovieList: Decodable {
    var page: Int
    var totalResults: Int?
    var totalPages: Int?
    var results: [Movie]
}

public struct Movie: Decodable {
    var voteCount: Int?
    var id: Int?
    var video: Bool?
    var voteAverage: Float?
    var title: String?
    var popularity: Float?
    var posterPath: String?
    var originalLanguage: String?
    var originalTitle: String?
    var genreIds: [Int]?
    var backdropPath: String?
    var adult: Bool?
    var overview: String?
    var releaseDate: String?
}
