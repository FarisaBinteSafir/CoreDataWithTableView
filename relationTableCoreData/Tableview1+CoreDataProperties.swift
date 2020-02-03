//
//  Tableview1+CoreDataProperties.swift
//  relationTableCoreData
//
//  Created by Farisa on 1/30/20.
//  Copyright © 2020 Farisa. All rights reserved.
//
//

import Foundation
import CoreData


extension Tableview1 {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Tableview1> {
        return NSFetchRequest<Tableview1>(entityName: "Tableview1")
    }

    @NSManaged public var country_name: String?
    @NSManaged public var map: NSSet?

}

// MARK: Generated accessors for map
extension Tableview1 {

    @objc(addMapObject:)
    @NSManaged public func addToMap(_ value: Tableview2)

    @objc(removeMapObject:)
    @NSManaged public func removeFromMap(_ value: Tableview2)

    @objc(addMap:)
    @NSManaged public func addToMap(_ values: NSSet)

    @objc(removeMap:)
    @NSManaged public func removeFromMap(_ values: NSSet)

}
