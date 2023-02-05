//
//  FavoritesDat+CoreDataProperties.swift
//  RecipeApp
//
//  Created by Arip Khozhbanov on 03.02.2023.
//
//

import Foundation
import CoreData


extension FavoritesDat {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FavoritesDat> {
        return NSFetchRequest<FavoritesDat>(entityName: "FavoritesDat")
    }

    @NSManaged public var id: Int64

}

extension FavoritesDat : Identifiable {

}
