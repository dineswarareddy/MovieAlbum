//
//  CoreDataHandler.swift
//  MovieAlbumApp
//
//  Created by Dinesh Reddy on 27/07/19.
//  Copyright © 2019 Dinesh Reddy. All rights reserved.
//

import Foundation
import CoreData
import UIKit

enum CoreDataConstants {
    static let entityName = "MovieEntity"
    enum Attributs {
        static let title = "title"
        static let originalTitle = "originalTitle"
        static let rating = "rating"
        static let overview = "overview"
        static let movieImage = "movieImagePath"
        static let releaseDate = "releaseDate"
    }
}

struct MovieModelCoreData {
    let originalTitle: String?
    let title: String?
    let overview: String?
    let rating: Float?
    let releaseDate: String?
    let movieImage: String?
    
    init(originalTitle: String?, title: String?, overview: String?, rating: Float?, releaseDate: String?, movieImagePath: String?) {
        self.originalTitle = originalTitle
        self.title = title
        self.overview = overview
        self.rating = rating
        self.releaseDate = releaseDate
        self.movieImage = movieImagePath
    }
}


class CoreDataHandler {
    var movies: [NSManagedObject] = []
    var appDelegate: AppDelegate?
    var managedContext : NSManagedObjectContext?
    var entity : NSEntityDescription?
    
    private func setupCoredata() {
        if let appDelegate =
            UIApplication.shared.delegate as? AppDelegate {
            self.appDelegate = appDelegate
        }
        // Created managed object context
            managedContext = appDelegate?.persistentContainer.viewContext
        // Created entity
        if let context = managedContext {
            entity = NSEntityDescription.entity(forEntityName: CoreDataConstants.entityName,
                                       in: context)
        }
    }
    
    init() {
        setupCoredata()
    }
    
    func saveMovie(_ movieToSave: MovieModelCoreData) -> Bool {
        if let entity = self.entity {
            let movieObject = NSManagedObject(entity: entity,
                                              insertInto: managedContext)
            
            // 3
            movieObject.setValue(movieToSave.title, forKeyPath: CoreDataConstants.Attributs.title)
            movieObject.setValue(movieToSave.originalTitle, forKeyPath: CoreDataConstants.Attributs.originalTitle)
            movieObject.setValue(movieToSave.overview, forKeyPath: CoreDataConstants.Attributs.overview)
            movieObject.setValue(movieToSave.movieImage, forKeyPath: CoreDataConstants.Attributs.movieImage)
            movieObject.setValue(movieToSave.releaseDate, forKeyPath: CoreDataConstants.Attributs.releaseDate)
            movieObject.setValue(movieToSave.rating, forKeyPath: CoreDataConstants.Attributs.rating)
            
            // 4
            do {
                try self.managedContext?.save()
                return true
            } catch let error as NSError {
                print("Could not save. \(error), \(error.userInfo)")
                return false
            }
        }
        return false
    }
    
    func fetchMoviesList(completionHandler: @escaping (_ moviesList: [NSManagedObject]?, _ error: Error?) -> (Void)) {
        //2
        let fetchRequest =
            NSFetchRequest<NSManagedObject>(entityName: CoreDataConstants.entityName)
        if let context = managedContext {
            //3
            do {
                movies = try context.fetch(fetchRequest)
                completionHandler(movies, nil)
            } catch let error as NSError {
                print("Could not fetch. \(error), \(error.userInfo)")
                completionHandler(nil, error)
            }
        }
        
    }
}
