//
//  CourseworkData+CoreDataProperties.swift
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

extension CourseworkData {

    @NSManaged var name: String?
    @NSManaged var weight: String?
    @NSManaged var startDate: NSDate?
    @NSManaged var endDate: NSDate?
    @NSManaged var markAwarded: String?
    @NSManaged var reminder: NSDate?
    @NSManaged var notes: String?
    @NSManaged var level: String?
    @NSManaged var courseworkID: String?
    @NSManaged var moduleID: String?

}
