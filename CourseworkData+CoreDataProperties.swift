//
//  CourseworkData+CoreDataProperties.swift
//  Coursework Management Tool
//
//  Created by Zakariya Kassim on 09/05/2016.
//  Copyright © 2016 MACBOOKPRO. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension CourseworkData {

    @NSManaged var name: String?
    @NSManaged var weight: NSNumber?
    @NSManaged var startDate: NSDate?
    @NSManaged var endDate: NSDate?
    @NSManaged var markAwarded: NSNumber?
    @NSManaged var reminder: NSDate?
    @NSManaged var notes: String?
    @NSManaged var courseworkToModule: ModuleData?
    @NSManaged var courseworkToTask: NSSet?

}
