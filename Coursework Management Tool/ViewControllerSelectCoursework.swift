//
//  ViewControllerMainMenu.swift
//  Coursework Management Tool
//
//  Created by MACBOOKPRO on 07/04/2016.
//  Copyright © 2016 MACBOOKPRO. All rights reserved.
//

import UIKit

class ViewControllerSelectCoursework: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    
    
    
    
    
    var position: Int?
    var dataController = DataController()
//var items: [String] = ["We", "Heart", "Swift"]

    
    @IBOutlet weak var table: UITableView!
    
    var courseworks = [String]()
    
    var module: String? {
        didSet {
           courseworks = self.dataController.getCourseworkByModule(module!)
            
                    print("set " + module!)
            
        }
    }
    
  /*  func configureView() {
        // Update the user interface for the detail item.
        
        if let detail = self.module {
            if let name = self.txtModule {
                name.text = detail.name
            }
            if let code = self.txtCode {
                code.text = String(position)
            }
        }
    } */
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.table.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")

    }
 
 
 
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.courseworks.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = self.table.dequeueReusableCellWithIdentifier("cell")! as UITableViewCell
        
        cell.textLabel?.text = dataController.idToCoursework(courseworks[indexPath.row])
        
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
        
        print(segue.identifier)
        
        if (segue.identifier == "selectTask") {
            
            if (position != nil){
                
                let vc: ViewControllerSelectTask = segue.destinationViewController as! ViewControllerSelectTask
                vc.coursework = self.courseworks[position!]
                
            }
        }
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
