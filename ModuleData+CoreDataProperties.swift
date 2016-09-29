//
//  ModuleData+CoreDataProperties.swift
//  Coursework Management Tool
//
//  Created by Zakariya Kassim on 16/05/2016.
//  Copyright © 2016 MACBOOKPRO. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension ModuleData {

    @NSManaged var code: String?
    @NSManaged var level: String?
    @NSManaged var name: String?
    @NSManaged var credits: String?
    @NSManaged var tutor: String?
    @NSManaged var moduleID: String?

}
