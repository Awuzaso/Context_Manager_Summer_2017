//
//  OKtoSwitchDialog.swift
//  ContextManager_HCC
//
//  Created by Awuzaso on 5/26/17.
//  Copyright © 2017 Osa. All rights reserved.
//

import Cocoa

class OKtoSwitchDialog: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    
    @IBAction func OK_Button(sender: AnyObject) {
        singleton.setOKtoSwitch(true)
        singleton.openWindowObject.stopEvents()

    }
    
    
    
    @IBAction func Cancel_Button(sender: AnyObject) {
        
        singleton.openWindowObject.stopEvents()


    }
    
    
}
