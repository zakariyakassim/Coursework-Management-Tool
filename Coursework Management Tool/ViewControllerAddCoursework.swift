//
//  ViewControllerMainMenu.swift
//  Coursework Management Tool
//
//  Created by MACBOOKPRO on 07/04/2016.
//  Copyright © 2016 MACBOOKPRO. All rights reserved.
//

import UIKit

class ViewControllerAddCoursework: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

   // @IBOutlet weak var btnAddCoursework: MyButton!
    @IBOutlet weak var btnSave: MyButton!
        @IBOutlet weak var btnCancel: MyButton!
    
    
    @IBOutlet weak var handedDatePicker: UIDatePicker!
    
    
    @IBOutlet weak var dueDatePicker: UIDatePicker!
    
    @IBOutlet weak var reminderDate: UIDatePicker!
    
    @IBOutlet weak var txtCoursework: UITextField!

    @IBOutlet weak var weightPickerView: UIPickerView!

        var selectedWeight: String!

  //  var placeHolderData: String!
    var weight = ["5%", "10%", "15%", "20%", "25%", "30%", "35%", "40%", "45%", "50%", "55%", "60%", "65%", "70%", "75%", "80%", "85%", "90%", "95%", "100%"];

    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        self.customTextFieldStyle(txtCoursework, text: "Module Name")
        
        self.weightPickerView.backgroundColor = UIColor.clearColor()
        self.weightPickerView.delegate = self
        self.weightPickerView.dataSource = self
        self.weightPickerView.layer.borderWidth = 2
        self.weightPickerView.layer.borderColor = UIColor(red: 0.165, green:0.427, blue:0.620, alpha:1.00).CGColor
        self.weightPickerView.layer.cornerRadius = 8
        
        
        
        
        datePickerStyle(handedDatePicker)
        datePickerStyle(dueDatePicker)
        datePickerStyle(reminderDate)
        
       
        buttonStyle(btnSave)
        buttonStyle(btnCancel)
        


        
        selectedWeight = "50%"

    }
    
    func datePickerStyle(datePicker: UIDatePicker){
        datePicker.layer.borderWidth = 2
       datePicker.layer.cornerRadius = 8
        datePicker.sizeToFit()
        datePicker.layer.borderColor = UIColor(red: 0.165, green:0.427, blue:0.620, alpha:1.00).CGColor
        
        datePicker.setValue(UIColor.whiteColor(), forKey: "textColor")
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
        

             return weight.count

    }
    
    func pickerView(pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        var attributedString: NSAttributedString!
        

            
            attributedString = NSAttributedString(string: weight[row], attributes: [NSForegroundColorAttributeName : UIColor.whiteColor()])
            
            return attributedString
            
        

        
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        

           
            print(weight[row])
            
            selectedWeight = weight[row]
            
        
        
    }

    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
