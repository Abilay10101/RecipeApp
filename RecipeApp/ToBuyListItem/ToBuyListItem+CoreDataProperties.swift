//
//  ToBuyListItem+CoreDataProperties.swift
//  RecipeApp
//
//  Created by Arip Khozhbanov on 22.01.2023.
//
//

import Foundation
import CoreData


extension ToBuyListItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ToBuyListItem> {
        return NSFetchRequest<ToBuyListItem>(entityName: "ToBuyListItem")
    }

    @NSManaged public var name: String?

}

extension ToBuyListItem : Identifiable {

}
