//
//  ViewControllerMainMenu.swift
//  Coursework Management Tool
//
//  Created by MACBOOKPRO on 07/04/2016.
//  Copyright © 2016 MACBOOKPRO. All rights reserved.
//

import UIKit


class ViewControllerAddModule: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

        var style = Style()

    
    var dataController = DataController()
    
   // @IBOutlet weak var btnAddCoursework: MyButton!
    @IBOutlet weak var btnSave: UIBarButtonItem!

    @IBOutlet weak var txtModule: UITextField!
    @IBOutlet weak var txtCode: UITextField!
    @IBOutlet weak var levelPickerView: UIPickerView!
    
    @IBOutlet weak var txtTutor: UITextField!
    @IBOutlet weak var creditsPickerView: UIPickerView!
    @IBOutlet weak var btnAddCoursework: MyButton!
        var selectedLevel: String!
    var selectedCredits: String!

    var placeHolderData: String!
    var levels = ["Level 4", "Level 5", "Level 6", "Level 7"];
    var credits = ["15 Credits", "30 Credits", "45 Credits"];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        self.style.customTextFieldStyle(txtModule, text: "Module Name")
        self.style.customTextFieldStyle(txtCode, text: "Module Code")
        self.style.customTextFieldStyle(txtTutor, text: "Tutor Name")
        
        self.style.pickeviewStyle(levelPickerView, delegate: self, dataSource: self)
        self.style.pickeviewStyle(creditsPickerView, delegate: self, dataSource: self)
        
       // self.style.buttonStyle(btnSave)
      //  self.style.buttonStyle(btnAddCoursework)

        selectedLevel = "Level 4"
        selectedCredits = "15 Credits"

    }
 
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if pickerView == levelPickerView {
             return levels.count
        } else if pickerView == creditsPickerView{
             return credits.count
        }
        
        return 0
    }
    
    func pickerView(pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        var attributedString: NSAttributedString!
        
        if pickerView == levelPickerView {
            
            attributedString = NSAttributedString(string: levels[row], attributes: [NSForegroundColorAttributeName : UIColor.whiteColor()])
            
            return attributedString
            
        } else if pickerView == creditsPickerView{
           
            attributedString = NSAttributedString(string: credits[row], attributes: [NSForegroundColorAttributeName : UIColor.whiteColor()])
            
           
            return attributedString
        }
        return nil
        
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        
        
        if pickerView == levelPickerView {
           
            print(levels[row])
            
            selectedLevel = levels[row]
            
        } else if pickerView == creditsPickerView{
            
            print(credits[row])
            
            selectedCredits = credits[row]
            
        }
        
        
    }

    
    /*@IBAction func btnSave(sender: UIBarButtonItem) {
        
        dataController.addModule(NSUUID().UUIDString, name: txtModule.text!, code: txtCode.text!, level: selectedLevel, tutor: txtTutor.text!, credits: selectedCredits)

        
    } */
    
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        dataController.addModule(NSUUID().UUIDString, name: txtModule.text!, code: txtCode.text!, level: selectedLevel, tutor: txtTutor.text!, credits: selectedCredits)
        
    }
    
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
