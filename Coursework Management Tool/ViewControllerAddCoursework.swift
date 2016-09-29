//
//  ViewControllerMainMenu.swift
//  Coursework Management Tool
//
//  Created by MACBOOKPRO on 07/04/2016.
//  Copyright © 2016 MACBOOKPRO. All rights reserved.
//

import UIKit
import EventKit

class ViewControllerAddCoursework: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    var dataController = DataController()
    var style = Style()
        var savedEventId : String = ""
    
   // @IBOutlet weak var btnAddCoursework: MyButton!
    @IBOutlet weak var btnSave: UIBarButtonItem!
    
    @IBOutlet weak var btnCancel: UIBarButtonItem!

    @IBOutlet weak var handedDatePicker: UIDatePicker!
    
    @IBOutlet weak var dueDatePicker: UIDatePicker!
    
    @IBOutlet weak var reminderDate: UIDatePicker!
    
    @IBOutlet weak var txtCoursework: UITextField!

    @IBOutlet weak var weightPickerView: UIPickerView!
    
    
    @IBOutlet weak var markAwardedPickerView: UIPickerView!
    
    @IBOutlet weak var modulePickerView: UIPickerView!

    var selectedWeight: String!
    var selectedMarkAwarded: String!
    var selectedModule: String!

  //  var placeHolderData: String!
    var weight = [String]()

    var markAwarded = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()

        self.style.customTextFieldStyle(txtCoursework, text: "Coursework Name")
        
        self.style.pickeviewStyle(weightPickerView, delegate: self, dataSource: self)
        
        self.style.pickeviewStyle(markAwardedPickerView, delegate: self, dataSource: self)
        
        self.style.pickeviewStyle(modulePickerView, delegate: self, dataSource: self)
        
        
        self.style.datePickerStyle(handedDatePicker)
        self.style.datePickerStyle(dueDatePicker)
        self.style.datePickerStyle(reminderDate)
        
       // self.style.buttonStyle(btnSave)
       // self.style.buttonStyle(btnCancel)

        selectedWeight = "50%"
        
        for i in 0 ... 100 {
            markAwarded.insert(String(i)+"%", atIndex: i)
            weight.insert(String(i)+"%", atIndex: i)
        }
        
        

    }
    
   
 
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        

        if pickerView == weightPickerView {
            
            
            return weight.count
            
        } else if pickerView == markAwardedPickerView{

            
            return markAwarded.count
            
        } else if pickerView == modulePickerView{
            
            
            return dataController.fetchModules().count
        }

        
             return 0

    }
    
    func pickerView(pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        var attributedString: NSAttributedString!
   

        
        if pickerView == weightPickerView {
            
        attributedString = NSAttributedString(string: weight[row], attributes: [NSForegroundColorAttributeName : UIColor.whiteColor()])
            
        } else if pickerView == markAwardedPickerView{
            
        attributedString = NSAttributedString(string: markAwarded[row], attributes: [NSForegroundColorAttributeName : UIColor.whiteColor()])
            
        } else if pickerView == modulePickerView{
            
        attributedString = NSAttributedString(string: dataController.idToModule(dataController.fetchModules()[row]), attributes: [NSForegroundColorAttributeName : UIColor.whiteColor()])
        }
        
    
            return attributedString

    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {


        
        if pickerView == weightPickerView {
            
            
            print(weight[row])
            selectedWeight = weight[row]
            
        } else if pickerView == markAwardedPickerView{
            
            
            selectedMarkAwarded = markAwarded[row]
            
            
        } else if pickerView == modulePickerView{
            
            if dataController.fetchModules().count != 0{
            selectedModule = dataController.fetchModules()[row]
            }
        }

        

    }

   /* @IBAction func btnSave(sender: UIBarButtonItem) {


        dataController.addCoursework(NSUUID().UUIDString, name: txtCoursework.text!, weight: selectedWeight, startDate: handedDatePicker.date, endDate: dueDatePicker.date, markAwarded: "8", reminder: reminderDate.date, notes: "zaaaak", module: "themodule", level: "5", moduleID: selectedModule)
        
        
        
        
        
        
        let eventStore = EKEventStore()
        
        let startDate = dueDatePicker.date
        let endDate = startDate.dateByAddingTimeInterval(60 * 60) // One hour
        
        if (EKEventStore.authorizationStatusForEntityType(.Event) != EKAuthorizationStatus.Authorized) {
            eventStore.requestAccessToEntityType(.Event, completion: {
                granted, error in
                self.createEvent(eventStore, title: "DJ's Test Event", startDate: startDate, endDate: endDate)
            })
        } else {
            createEvent(eventStore, title: "DJ's Test Event", startDate: startDate, endDate: endDate)
        }


    } */
    
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        dataController.addCoursework(NSUUID().UUIDString, name: txtCoursework.text!, weight: selectedWeight, startDate: handedDatePicker.date, endDate: dueDatePicker.date, markAwarded: "8", reminder: reminderDate.date, notes: "zaaaak", module: "themodule", level: "5", moduleID: selectedModule)
        
        
        
        
        
        
        let eventStore = EKEventStore()
        
        let startDate = dueDatePicker.date
        let endDate = startDate.dateByAddingTimeInterval(60 * 60) // One hour
        
        if (EKEventStore.authorizationStatusForEntityType(.Event) != EKAuthorizationStatus.Authorized) {
            eventStore.requestAccessToEntityType(.Event, completion: {
                granted, error in
                self.createEvent(eventStore, title: "Coursework " + self.txtCoursework.text!, startDate: startDate, endDate: endDate)
            })
        } else {
            createEvent(eventStore, title: "Coursework " + self.txtCoursework.text! , startDate: startDate, endDate: endDate)
        }
        
    }
    
    
    
    
    
    
    func createEvent(eventStore: EKEventStore, title: String, startDate: NSDate, endDate: NSDate) {
        let event = EKEvent(eventStore: eventStore)
        
        event.title = title
        event.startDate = startDate
        event.endDate = endDate
        event.calendar = eventStore.defaultCalendarForNewEvents
        do {
            try eventStore.saveEvent(event, span: .ThisEvent)
            savedEventId = event.eventIdentifier
        } catch {
            print("Bad things happened")
        }
    }
    
    // Removes an event from the EKEventStore. The method assumes the eventStore is created and
    // accessible
    func deleteEvent(eventStore: EKEventStore, eventIdentifier: String) {
        let eventToRemove = eventStore.eventWithIdentifier(eventIdentifier)
        if (eventToRemove != nil) {
            do {
                try eventStore.removeEvent(eventToRemove!, span: .ThisEvent)
            } catch {
                print("Bad things happened")
            }
        }
    }
    
    // Responds to button to add event. This checks that we have permission first, before adding the
    // event
    @IBAction func addEvent(sender: UIButton) {
        let eventStore = EKEventStore()
        
        let startDate = NSDate()
        let endDate = startDate.dateByAddingTimeInterval(60 * 60) // One hour
        
        if (EKEventStore.authorizationStatusForEntityType(.Event) != EKAuthorizationStatus.Authorized) {
            eventStore.requestAccessToEntityType(.Event, completion: {
                granted, error in
                self.createEvent(eventStore, title: "DJ's Test Event", startDate: startDate, endDate: endDate)
            })
        } else {
            createEvent(eventStore, title: "DJ's Test Event", startDate: startDate, endDate: endDate)
        }
    }
    
    
    // Responds to button to remove event. This checks that we have permission first, before removing the
    // event
    @IBAction func removeEvent(sender: UIButton) {
        let eventStore = EKEventStore()
        
        if (EKEventStore.authorizationStatusForEntityType(.Event) != EKAuthorizationStatus.Authorized) {
            eventStore.requestAccessToEntityType(.Event, completion: { (granted, error) -> Void in
                self.deleteEvent(eventStore, eventIdentifier: self.savedEventId)
            })
        } else {
            deleteEvent(eventStore, eventIdentifier: savedEventId)
        }
        
    }
    
    
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
