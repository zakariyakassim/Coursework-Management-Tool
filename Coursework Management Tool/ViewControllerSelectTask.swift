//
//  ViewControllerMainMenu.swift
//  Coursework Management Tool
//
//  Created by MACBOOKPRO on 07/04/2016.
//  Copyright © 2016 MACBOOKPRO. All rights reserved.
//

import UIKit

class ViewControllerSelectTask: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    

    var dataController = DataController()

    var position: Int?
    
    @IBOutlet weak var table: UITableView!
    
    var tasks = [String]()
    
    var coursework: String? {
        didSet {
            tasks = self.dataController.getTaskByCoursework(coursework!)
            
            print(" set " + String(tasks.count))
            
        }
    }
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.table.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
    }
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tasks.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = self.table.dequeueReusableCellWithIdentifier("cell")! as UITableViewCell
        
        cell.textLabel?.text = dataController.idToTask(tasks[indexPath.row])
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        // print(dataController.fetchCoursework()[indexPath.row])
        
        //  print(dataController.idToCoursework("01EDC85C-49F5-4704-A109-0CCEB996F895"))
        
        
        // print(self.dataController.fetchModules()[indexPath.row])
        
        //  let courseworks = dataController.getCourseworkByModule(self.dataController.fetchModules()[indexPath.row])
        
        //  for x in courseworks {
        //      print(dataController.idToCoursework(x))
        //  }
        // print(dataController.idToCoursework(dataController.getCourseworkByModule(self.dataController.fetchModules()[indexPath.row]).first!))
        
               position = indexPath.row
        
        
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        

       // if (segue.identifier == "task") {
            
           
           
                let vc: ViewControllerViewTask = segue.destinationViewController as! ViewControllerViewTask
             //   vc.coursework = self.courseworks[position!]
                
                let ss = dataController.allTaskData(tasks[position!])
                

            vc.taskTitle = ss.title
            vc.taskNotes = ss.notes
            vc.taskCompleted = ss.completeAmount

            
                
            
    //    }
 
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
