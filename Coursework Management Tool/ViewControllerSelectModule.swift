//
//  ViewControllerMainMenu.swift
//  Coursework Management Tool
//
//  Created by MACBOOKPRO on 07/04/2016.
//  Copyright © 2016 MACBOOKPRO. All rights reserved.
//

import UIKit

class ViewControllerSelectModule: UIViewController, UITableViewDelegate, UITableViewDataSource  {

    var dataController = DataController()
    var position: Int?
    @IBOutlet weak var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.table.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")

    }
 
 
 
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataController.fetchModules().count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = self.table.dequeueReusableCellWithIdentifier("cell")! as UITableViewCell
        
        cell.textLabel?.text = dataController.idToModule(self.dataController.fetchModules()[indexPath.row])
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
       // print(dataController.fetchCoursework()[indexPath.row])
        
      //  print(dataController.idToCoursework("01EDC85C-49F5-4704-A109-0CCEB996F895"))
        
        
       // print(self.dataController.fetchModules()[indexPath.row])
        
       // let courseworks = dataController.getCourseworkByModule(self.dataController.fetchModules()[indexPath.row])
        
     //   for x in courseworks {
      //      print(dataController.idToCoursework(x))
    //    }
      // print(dataController.idToCoursework(dataController.getCourseworkByModule(self.dataController.fetchModules()[indexPath.row]).first!))
        
    position = indexPath.row
       
        
    }

 
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        print(segue.identifier)
        
        if (segue.identifier == "selectCoursework") {
        
        if (position != nil){
   
        let vc: ViewControllerSelectCoursework = segue.destinationViewController as! ViewControllerSelectCoursework
        vc.module = self.dataController.fetchModules()[position!]
        
        }
        }

    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
