//
//  ViewControllerMainMenu.swift
//  Coursework Management Tool
//
//  Created by MACBOOKPRO on 07/04/2016.
//  Copyright © 2016 MACBOOKPRO. All rights reserved.
//

import UIKit

class ViewControllerViewTask: UIViewController{
    
    var style = Style()
    
   /* @IBOutlet weak var txtModuleName: UILabel!
    @IBOutlet weak var txtModuleCredits: UILabel!
    @IBOutlet weak var txtModuleLevel: UILabel!
    @IBOutlet weak var txtCourseworkName: UILabel!
    @IBOutlet weak var txtCourseworkWeight: UILabel!
    @IBOutlet weak var txtCourseworkReminder: UILabel!
    @IBOutlet weak var txtCourseworkStartDate: UILabel!
    @IBOutlet weak var txtCourseworkEndDate: UILabel!
    @IBOutlet weak var txtCourseworkMarkAwarded: UILabel! */
    
    @IBOutlet weak var btnCompleted: MyButton!
    @IBOutlet weak var btnDaysToGo: MyButton!
    
    @IBOutlet weak var txtTaskTitle: UILabel!

    @IBOutlet weak var txtTaskNotes: UILabel!

   /* var moduleName: String?
    var moduleCredits: String?
    var moduleLevel: String?
    var courseworkName: String?
    var courseworkWeight: String?
    var courseworkReminder: String?
    var courseworkStartDate: String?
    var courseworkEndDate: String?
    var courseworkMarkAwarded: String?
    var taskReminder: String? */

    var startDate: String?
    var endDate: String?
    
    var taskTitle: String?
    var taskCompleted: String?
    var taskNotes: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.style.buttonStyle(btnCompleted)
        self.style.buttonStyle(btnDaysToGo)
        
     /*   txtTaskCompleted.text = taskCompleted
        txtTaskReminder.text = taskReminder
           txtModuleName.text = moduleName
           txtModuleCredits.text = moduleCredits
           txtModuleLevel.text = moduleLevel
           txtCourseworkName.text = courseworkName
           txtCourseworkWeight.text = courseworkWeight
           txtCourseworkReminder.text = courseworkReminder
           txtCourseworkStartDate.text = courseworkStartDate
           txtCourseworkEndDate.text = courseworkEndDate
           txtCourseworkMarkAwarded.text = courseworkMarkAwarded */
        
        
           txtTaskTitle.text = taskTitle

           txtTaskNotes.text = taskNotes
        btnCompleted.setTitle(taskCompleted, forState: .Normal)
        
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        print(segue.identifier)
        
        //  print(tasks[position!])
        
        //print(dataController.getPercentageByTask(tasks[position!]))
        
        if (segue.identifier == "completed"){
        
        let vc: ViewControllerGraphicalPercentage = segue.destinationViewController as! ViewControllerGraphicalPercentage
        var j = taskCompleted!.stringByReplacingOccurrencesOfString("%", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
        
        j = "0."+j
        print(j)
        print(CGFloat(Double(j)!))
        
        vc.to = CGFloat(Double(j)!)
            
        } else if (segue.identifier == "daysRemaining"){
            
            let vc: ViewControllerGraphicalPercentage = segue.destinationViewController as! ViewControllerGraphicalPercentage

            
            
            
            
            
            let start = "2010-09-01"
            let end = "2010-09-05"
            
            let dateFormatter = NSDateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            
            let startDate:NSDate = dateFormatter.dateFromString(start)!
            let endDate:NSDate = dateFormatter.dateFromString(end)!
            
            let cal = NSCalendar.currentCalendar()
            
            
            let unit:NSCalendarUnit = .Day
            
            let components = cal.components(unit, fromDate: startDate, toDate: endDate, options: [])
            
            
            print(components)
            
            
            
            
            
            
            
            
            let j = "0."+String(components.day)
            print(j)
            print(CGFloat(Double(j)!))
            
            vc.to = CGFloat(Double(j)!)
            
            
        }
        
        
    }

    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
