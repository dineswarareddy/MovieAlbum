//
//  ServiceHandler.swift
//  MovieAlbumApp
//
//  Created by Dinesh Reddy on 26/07/19.
//  Copyright © 2019 Dinesh Reddy. All rights reserved.
//

import Foundation
import Alamofire

enum DefinedError: String, Error {
    case urlFormatError = "Invalid URL Format"
    case serviceError = "Server issue"
}

class ServiceHandler: NSObject {
    typealias ServiceCallBack = (_ response: Any?, _ error: Error?) -> (Void)
    
    class func fetchMovieList(requestURL: URL, parameters: [String: Any] = [:], completion: @escaping ServiceCallBack) {
        Alamofire.request(requestURL,
                          method: .get,
                          parameters: parameters)
            .validate()
            .responseJSON { response in
                guard response.result.isSuccess else {
                    print(response.result.error.debugDescription)
                    completion(nil, DefinedError.serviceError)
                    return
                }
                completion(response.result.value, nil)
        }
    }
}
