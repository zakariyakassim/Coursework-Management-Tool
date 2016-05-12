//
//  ViewControllerMainMenu.swift
//  Coursework Management Tool
//
//  Created by MACBOOKPRO on 07/04/2016.
//  Copyright © 2016 MACBOOKPRO. All rights reserved.
//

import UIKit

class ViewControllerAddModule: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

   // @IBOutlet weak var btnAddCoursework: MyButton!
    @IBOutlet weak var btnSave: MyButton!
    @IBOutlet weak var txtModule: UITextField!
    @IBOutlet weak var txtCode: UITextField!
    @IBOutlet weak var levelPickerView: UIPickerView!
    
    @IBOutlet weak var txtTutor: UITextField!
    @IBOutlet weak var creditsPickerView: UIPickerView!
    @IBOutlet weak var btnCancel: MyButton!
        var selectedLevel: String!

    var placeHolderData: String!
    var levels = ["Level 4", "Level 5", "Level 6", "Level 7"];
    var credits = ["15 Credits", "30 Credits", "45 Credits"];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        self.customTextFieldStyle(txtModule, text: "Module Name")
        self.customTextFieldStyle(txtCode, text: "Module Code")
        self.customTextFieldStyle(txtTutor, text: "Tutor Name")
        
        self.levelPickerView.backgroundColor = UIColor.clearColor()
        self.levelPickerView.delegate = self
       self.levelPickerView.dataSource = self
        self.levelPickerView.layer.borderWidth = 2
        self.levelPickerView.layer.borderColor = UIColor(red: 0.165, green:0.427, blue:0.620, alpha:1.00).CGColor
        self.levelPickerView.layer.cornerRadius = 8
        
        self.creditsPickerView.backgroundColor = UIColor.clearColor()
        self.creditsPickerView.delegate = self
        self.creditsPickerView.dataSource = self
        self.creditsPickerView.layer.borderWidth = 2
        self.creditsPickerView.layer.borderColor = UIColor(red: 0.165, green:0.427, blue:0.620, alpha:1.00).CGColor
        self.creditsPickerView.layer.cornerRadius = 8
        
        buttonStyle(btnSave)
        buttonStyle(btnCancel)
        
        
        
      //  self.btnSave.backgroundColor = UIColor.clearColor()
      //  self.btnSave.backgroundColor = UIColor.clearColor()
      //  self.btnSave.setFillColor(UIColor(red: 0.165, green:0.427, blue:0.620, alpha:1.00))
      //  self.btnSave.setRadius(15,setTopRight: 15,setBottomLeft: 15,setBottomRight: 15)
        
     //   self.btnAddCoursework.backgroundColor = UIColor.clearColor()
      // self.btnAddCoursework.setFillColor(UIColor(red: 0.165, green:0.427, blue:0.620, alpha:1.00))
      //  self.btnAddCoursework.setRadius(15,setTopRight: 15,setBottomLeft: 15,setBottomRight: 15)
        
        selectedLevel = "Level 4"

    }
 
    func buttonStyle(button: MyButton) {
        button.backgroundColor = UIColor.clearColor()
        button.backgroundColor = UIColor.clearColor()
        button.setFillColor(UIColor(red: 0.165, green:0.427, blue:0.620, alpha:1.00))
        button.setRadius(15,setTopRight: 15,setBottomLeft: 15,setBottomRight: 15)
    }
 
 
    func customTextFieldStyle(textField: UITextField, text: String) {
        
        textField.backgroundColor = UIColor.clearColor()
        textField.attributedPlaceholder = NSAttributedString(string: text, attributes:[NSForegroundColorAttributeName: UIColor.grayColor()])
        textField.layer.cornerRadius = 8
        textField.layer.borderWidth = 2
        textField.layer.borderColor = UIColor(red: 0.165, green:0.427, blue:0.620, alpha:1.00).CGColor
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
            
            attributedString = NSAttributedString(string: levels[row], attributes: [NSForegroundColorAttributeName : UIColor(red: 0.165, green:0.427, blue:0.620, alpha:1.00)])
            
            return attributedString
            
        } else if pickerView == creditsPickerView{
           
            attributedString = NSAttributedString(string: credits[row], attributes: [NSForegroundColorAttributeName : UIColor(red: 0.165, green:0.427, blue:0.620, alpha:1.00)])
            
           
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
            
           // selectedLevel = credits[row]
            
        }
        
        
    }

    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
