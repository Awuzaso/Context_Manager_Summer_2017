//
//  contextManagerWindowController.swift
//  workingSetProject_v2
//
//  Created by Awuzaso on 12/2/16.
//  Copyright © 2016 Osa. All rights reserved.
//

import Cocoa

class contextManagerWindowController: NSWindowController {

    override func windowDidLoad() {
        super.windowDidLoad()
    
        
//        if(singleton.getUserPrefUIColor() != "plain"){
//            window?.backgroundColor = NSColor.yellowColor()
//        }
        
        //window?.backgroundColor = NSColor.yellowColor()
        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    }

    func separateColorVal(inVal:String)->[String]{
        let stringArr = inVal.componentsSeparatedByString(",")
        return stringArr
    }
    
    
    
    
    override init(window: NSWindow!)
    {
        super.init(window: window)
        print(__FILE__, __FUNCTION__)
    }
    
    required init?(coder: (NSCoder!))
    {
        super.init(coder: coder)
        print(__FILE__, __FUNCTION__)
    }
    
    
    
}
