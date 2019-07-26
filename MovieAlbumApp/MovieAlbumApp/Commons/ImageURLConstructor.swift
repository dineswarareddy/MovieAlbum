//
//  ImageURLConstructor.swift
//  MovieAlbumApp
//
//  Created by Dinesh Reddy on 26/07/19.
//  Copyright © 2019 Dinesh Reddy. All rights reserved.
//

import Foundation

class ImageULRConstructor {
    static func constructImageURL(imagePath: String) -> URL {
        var urlComponents = URLComponents()
        urlComponents.scheme = Constants.scheme
        if let baseURL = Bundle.main.object(forInfoDictionaryKey: Constants.PListKey.imageBaseURL) as? String {
            urlComponents.host = baseURL
        }
        urlComponents.path = "\(Constants.imageURLPath)\(imagePath)"
        return urlComponents.url!
    }
}
