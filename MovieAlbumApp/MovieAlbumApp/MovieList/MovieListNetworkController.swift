//
//  MovieListNetworkController.swift
//  MovieAlbumApp
//
//  Created by Dinesh Reddy on 26/07/19.
//  Copyright © 2019 Dinesh Reddy. All rights reserved.
//

import Foundation

enum Constants {
    static let sortQuery = "popularity.desc"
    static let listApiPath = "/3/discover/movie"
    static let imageURLPath = "/t/p/original"
    static let scheme = "https"
    enum PListKey {
        static let APIKey = "API_Key"
        static let imageBaseURL = "ImageBaseURL"
        static let movieListBaseURL = "movieBaseURL"
    }
    
    enum QueryKey {
        static let apiKey = "api_key"
        static let sortKey = "sort_by"
    }
    
    enum Segues {
        static let movieDetailPageSegue = "MovieDetailsPageNavigation"
    }
}

protocol MovieListControllerDelegate {
    func updateMovieList(movieList: [Movie])
    func updateServerError(error: Error)
}

final class MovieListNetworkController {
    var delegate: MovieListControllerDelegate?
    
    func initiateFetchingMovieList() {
        let urlToCall = self.constructURL()
        ServiceHandler.fetchMovieList(requestURL: urlToCall) { [weak self] (movieListData, error) -> (Void) in
            let jsonData = try? JSONSerialization.data(withJSONObject:movieListData)
            if let response = jsonData {
                self?.convertDataToMoviesList(movieListData: response)
            }
        }
    }
    
    private func convertDataToMoviesList(movieListData: Data) {
        let decoder = JSONDecoder()
        do {
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let movieList = try decoder.decode(MovieList.self, from: movieListData)
            delegate?.updateMovieList(movieList: movieList.results)
        } catch {
            delegate?.updateServerError(error: DefinedError.serviceError)
        }
    }
    
    private func constructURL() -> URL {
        let apiKey = Bundle.main.object(forInfoDictionaryKey: Constants.PListKey.APIKey)
        var urlComponents = URLComponents()
        urlComponents.scheme = Constants.scheme
        if let baseURL = Bundle.main.object(forInfoDictionaryKey: Constants.PListKey.movieListBaseURL) as? String {
            urlComponents.host = baseURL
        }
        urlComponents.path = Constants.listApiPath
        if let apiKey = apiKey as? String {
            urlComponents.queryItems = [
                URLQueryItem(name: Constants.QueryKey.apiKey, value: apiKey),
                URLQueryItem(name: Constants.QueryKey.sortKey, value: Constants.sortQuery)
            ]
        }
        return urlComponents.url!
    }
}
