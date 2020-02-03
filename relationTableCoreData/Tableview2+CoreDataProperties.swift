//
//  Tableview2+CoreDataProperties.swift
//  relationTableCoreData
//
//  Created by Farisa on 1/30/20.
//  Copyright © 2020 Farisa. All rights reserved.
//
//

import Foundation
import CoreData


extension Tableview2 {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Tableview2> {
        return NSFetchRequest<Tableview2>(entityName: "Tableview2")
    }

    @NSManaged public var division_name: String?
    @NSManaged public var map2: Tableview1?

}
