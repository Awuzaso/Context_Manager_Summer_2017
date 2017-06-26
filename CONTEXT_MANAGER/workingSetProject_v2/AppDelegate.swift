//
//  AppDelegate.swift
//  workingSetProject_v2
//
//  Created by Osa on 7/3/16.
//  Copyright © 2016 Osa. All rights reserved.
//

import Cocoa



@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
   
            var secondsPassed = 0.0
        /*Sets up constants.*/
            let openWindowObject = windowManager()
            let openWindowObject2 = windowManager()
        /*Sets up varuables.*/
            var windowController = NSWindowController()
            var unassocCardWinController = NSWindowController()
            var serialPortObject: SerialPortManager!
            var readerIsIdle = true
  
    func event(){
        if(singleton.cardIsOnReader == true){
            singleton.cardIsOnReader = false
            readerIsIdle = false
        }
        else{
            

                if(readerIsIdle == false){
                    print("////////////////////////////////////")
                    print("The card was removed.")
                    print("////////////////////////////////////")
                    singleton.openedWD = nil
                    readerIsIdle = true
                    NSNotificationCenter.defaultCenter().postNotificationName("resetOV", object: nil)
                    
                }
                else{
                    print("////////////////////////////////////")
                    print("Reader is idle.")
                    print("////////////////////////////////////")
                
            }
        }
        
        
        
        
    }
    
    
    // PRIMARY FUNCTIONS
    func applicationDidFinishLaunching(aNotification: NSNotification) {
        print("Function, \"applicationDidFinishLaunching(aNotification: NSNotification)\"  has been called. ")
        print("Initializing App")
        initializeApp()
        var timer = NSTimer.scheduledTimerWithTimeInterval(7, target: self, selector: "event", userInfo: nil, repeats: true)
        print("Function, \"applicationDidFinishLaunching(aNotification: NSNotification)\" has been exited. ")
    }

    
    func applicationWillTerminate(aNotification: NSNotification) {
        print("Function, \"applicationWillTerminate(aNotification: NSNotification)\"  has been called. ")
        print("Function, \"applicationWillTerminate(aNotification: NSNotification)\"  has been exited. ")
    }

    // INTERFACE FUNCTIONS
    @IBAction func launchWSDM_Window(sender: AnyObject){
            windowController.showWindow(sender)
    }

    
    func CheckChromeTabs()
    {
        print("Function, \"CheckChromeTabs()\"  has been called. ")
        
        /*From Shyam*/
        let myAppleScript = "set r to \"\"\n" +
            
            "tell application \"Google Chrome\"\n" +
            
            "repeat with w in windows\n" +
            
            "repeat with t in tabs of w\n" +
            
            "tell t to set r to r & \"Title : \" & title & \", URL : \" & URL & linefeed\n" +
            
            "end repeat\n" +
            
            "end repeat\n" +
            
            "end tell\n" +
            
        "return r"
        
        var error: NSDictionary?
        
        let scriptObject = NSAppleScript(source: myAppleScript)
        
        if let output: NSAppleEventDescriptor = scriptObject?.executeAndReturnError(&error)
            
        {
            
            let titlesAndURLs = output.stringValue!
            
            print(titlesAndURLs)
            
        }
            
        else if (error != nil)
            
        {
            
            print("error: \(error)")
            
        }
        print("Function, \"CheckChromeTabs()\"  has been exited. ")
    }
    
    
    
    func OpenURL(){
        print("Function, \"OpenURL()\"  has been called. ")
        /*From Shyam*/
        if let url = NSURL(string: "https://www.google.com") where NSWorkspace.sharedWorkspace().openURL(url)         {
            print("default browser was successfully opened")
        }
        else{
            print("browser was not opened successfully")
        }
        print("Function, \"OpenURL()\"  has been exited. ")
    }
    
    @IBAction func launchUserPrefWindow(sender: NSMenuItem) {
        print("Pref window is open.")
        singleton.openWindowObject.setWindow("Main", nameOfWindowController: "UserPrefWindow")
        singleton.openWindowObject.runModalWindow()
        
    }
    
    
}

