//
//  ViewControllerMainMenu.swift
//  Coursework Management Tool
//
//  Created by MACBOOKPRO on 07/04/2016.
//  Copyright © 2016 MACBOOKPRO. All rights reserved.
//

import UIKit

class ViewControllerAddTask: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    var dataController = DataController()
    
    var style = Style()
    
    
    @IBOutlet weak var btnSave: UIBarButtonItem!

    
    @IBOutlet weak var btnCancel: UIBarButtonItem!
    
    @IBOutlet weak var txtNotes: UITextView!

    
    
    @IBOutlet weak var completedPickerView: UIPickerView!

    
    @IBOutlet weak var reminderDate: UIDatePicker!
    
    @IBOutlet weak var txtTitle: UITextField!


    @IBOutlet weak var courseworkPickerView: UIPickerView!
    

        var selectedComplete: String!
    var selectedCoursework: String!

  //  var placeHolderData: String!
    var completed = ["0%", "5%", "10%", "15%", "20%", "25%", "30%", "35%", "40%", "45%", "50%", "55%", "60%", "65%", "70%", "75%", "80%", "85%", "90%", "95%", "100%"];

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.style.textViewStyle(txtNotes)
        

        self.style.customTextFieldStyle(txtTitle, text: "Title")

        

        self.style.datePickerStyle(reminderDate)
        
        self.style.pickeviewStyle(completedPickerView, delegate: self, dataSource: self)
        self.style.pickeviewStyle(courseworkPickerView, delegate: self, dataSource: self)
        
       
      //  self.style.buttonStyle(btnSave)
     //   self.style.buttonStyle(btnCancel)
        

        selectedComplete = "0%"
        
        
        
    

    }
    


 
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        

        if pickerView == completedPickerView {
            
            
            return completed.count
            
        } else if pickerView == courseworkPickerView{
            
            return dataController.fetchCoursework().count
            
        }
        
             return 0

    }
    
    func pickerView(pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        var attributedString: NSAttributedString!
        
        
        if pickerView == completedPickerView {
            
            attributedString = NSAttributedString(string: completed[row], attributes: [NSForegroundColorAttributeName : UIColor.whiteColor()])
            
        } else if pickerView == courseworkPickerView{
            
            attributedString = NSAttributedString(string: dataController.idToCoursework(dataController.fetchCoursework()[row]), attributes: [NSForegroundColorAttributeName : UIColor.whiteColor()])
            
        }

     
            
            
            return attributedString
    
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        
        
        
        if pickerView == completedPickerView {
            

             print(completed[row])
            
            selectedComplete = completed[row]
            
        } else if pickerView == courseworkPickerView{
            
            print(dataController.fetchCoursework()[row])
            
            selectedCoursework = dataController.fetchCoursework()[row]
            
        }

        
   
           
  
    }
    
    
    
    
  /*  @IBAction func btnSave(sender: UIBarButtonItem) {
        
        
        dataController.addTask(NSUUID().UUIDString, title: txtTitle.text!, notes: txtNotes.text!, completeAmount: selectedComplete, reminder: reminderDate.date, courseworkID: selectedCoursework)
        
       // dataController.addCoursework(txtCoursework.text!)
        
       // dataController.addTask(NSUUID().UUIDString, title: txtTitle.text!, notes: txtNotes.text!, completeAmount: selectedComplete)

  // dataController.addCoursework(txtCoursework.text!, weight: selectedWeight, startDate: handedDatePicker.date, endDate: dueDatePicker.date, markAwarded: "8", reminder: reminderDate.date, notes: "zaaaak", module: "themodule", level: "5")
        
      //  print(selectedWeight)
     //   print(handedDatePicker.date)
    //    print(dueDatePicker.date)
    //    print(reminderDate.date)
     
        
      //  dataController.addCoursework(txtCoursework.text!)
        
       // let id = NSUUID().UUIDString
       // print(id)
   

    } */
    
    

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        dataController.addTask(NSUUID().UUIDString, title: txtTitle.text!, notes: txtNotes.text!, completeAmount: selectedComplete, reminder: reminderDate.date, courseworkID: selectedCoursework)
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
