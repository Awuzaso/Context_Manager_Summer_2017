//
//  UserPrefController.swift
//  ContextManager_HCC
//
//  Created by Awuzaso on 5/25/17.
//  Copyright © 2017 Osa. All rights reserved.
//

import Cocoa

class UserPrefController: NSViewController {

    
    
    @IBOutlet weak var placementRadioButton: NSButton!
    
    
    @IBOutlet weak var tapRadioButton: NSButton!
    
    
    @IBOutlet weak var uiColorWellOption: NSColorWell!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    
    @IBAction func radioButtonChanged(_ sender: AnyObject) {
        if(placementRadioButton.state==1){
            print("Placement was selected.")
            
        }
        else if(tapRadioButton.state==1){
            print("Tap was selected.")

        }
    }
    
    
    
    
    
    
    
    
    @IBAction func okButtonFunc(sender: AnyObject) {
        
        //OK for card interaction option.
        if(placementRadioButton.state==1){
             singleton.coreDataObject.setValueOfEntityObject("User_Attr", idKey: "userName", nameOfKey: "userPrefCard", idName: "user1", editName: "place")
            singleton.setUserPrefCardInteraction("place")
            print("Placement was selected. Saved to DB.")

        }
        else if(tapRadioButton.state==1){
            singleton.coreDataObject.setValueOfEntityObject("User_Attr", idKey: "userName", nameOfKey: "userPrefCard", idName: "user1", editName: "tapping")
            singleton.setUserPrefCardInteraction("tapping")
            print("Tapping was selected. Saved to DB.")
            
        }
        
        
        
        
        
        
       
    
        let redComponent = uiColorWellOption.color.redComponent
        let greenComponent = uiColorWellOption.color.greenComponent
        let blueComponent = uiColorWellOption.color.blueComponent
        
        
        let prefColor = "\(redComponent),\(greenComponent),\(blueComponent)"
        
        let stringArr = prefColor.componentsSeparatedByString(",")
        print(stringArr)
        
        
        singleton.coreDataObject.setValueOfEntityObject("User_Attr", idKey: "userName", nameOfKey: "userPrefColor", idName: "user1", editName: prefColor)
        singleton.setUserPrefUIColor(prefColor)
      
        
        singleton.openWindowObject.stopEvents()

    }
    
    @IBAction func cancelButtonFunc(sender: AnyObject) {
        
        
        
        singleton.openWindowObject.stopEvents()

    }
}
