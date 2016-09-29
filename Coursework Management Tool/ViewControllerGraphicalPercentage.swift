//
//  ViewControllerMainMenu.swift
//  Coursework Management Tool
//
//  Created by MACBOOKPRO on 07/04/2016.
//  Copyright © 2016 MACBOOKPRO. All rights reserved.
//

import UIKit

class ViewControllerGraphicalPercentage: UIViewController{

    @IBOutlet weak var button: UIButton!
    
        var size = UIScreen.mainScreen().bounds
    
      var circle = TeethLoaderViewCA(frame: CGRectMake(UIScreen.mainScreen().bounds.width/2-150 , UIScreen.mainScreen().bounds.width/2-150, 300, 300 * 0.7))

    
    
    @IBOutlet var ctx: UIView!
    
    

    
    let from: CGFloat? = 0
    var to: CGFloat?
    
    override func loadView() {
        
       // size = CGRectMake(100 , 100, self.view.frame.width, self.view.frame.height * 0.7)
        

        
      
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        
        self.view = TeethLoaderView(frame: CGRectMake(UIScreen.mainScreen().bounds.width/2-150 , UIScreen.mainScreen().bounds.width/2-150, 300, 300 * 0.7)) // uncomment for core graphics version
        self.view = circle // comment for core graphics version
        
       // circle.animate(0, toValue: to!)
        
        
    }
    
    // Example function showing the animate() function working.
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        circle.animate(0, toValue: to!)
    }
    
    
       
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    
    
}

