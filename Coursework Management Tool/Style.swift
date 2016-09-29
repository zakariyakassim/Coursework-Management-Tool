//
//  Style.swift
//  Coursework Management Tool
//
//  Created by Zakariya Kassim on 15/05/2016.
//  Copyright © 2016 MACBOOKPRO. All rights reserved.
//

import Foundation
import UIKit

class Style {

    func textViewStyle(textView: UITextView){
        textView.backgroundColor = UIColor.clearColor()
        textView.layer.cornerRadius = 8
        textView.layer.borderWidth = 2
        textView.layer.borderColor = UIColor(red: 0.165, green:0.427, blue:0.620, alpha:1.00).CGColor
    }
    
    func pickeviewStyle(pickerView: UIPickerView, delegate: UIPickerViewDelegate, dataSource: UIPickerViewDataSource) {
        pickerView.backgroundColor = UIColor.clearColor()
        pickerView.delegate = delegate
        pickerView.dataSource = dataSource
        pickerView.layer.borderWidth = 2
        pickerView.layer.borderColor = UIColor(red: 0.165, green:0.427, blue:0.620, alpha:1.00).CGColor
        pickerView.layer.cornerRadius = 8
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



}

