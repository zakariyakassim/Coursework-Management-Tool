//
//  TaskData+CoreDataProperties.swift
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

extension TaskData {

    @NSManaged var notes: String?
    @NSManaged var reminder: NSDate?
    @NSManaged var taskName: String?
    @NSManaged var completeAmount: String?
    @NSManaged var title: String?
    @NSManaged var taskID: String?
    @NSManaged var courseworkID: String?

}
