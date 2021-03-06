//
//  AppDelegate_Ext.swift
//  workingSetProject_v2
//
//  Created by Osa on 8/2/16.
//  Copyright © 2016 Osa. All rights reserved.
//

import Cocoa

extension AppDelegate{
    
    
    
    
    func determineIfFirstTimeLaunch()->Bool{
        // 1 -  Get user preferences entity, "User Attrib"
        let result = singleton.coreDataObject.getCountOfDataObjects("User_Attr")
        
        // 2 - Assign cout of result to "result_count"
        let result_count = result
        
        // 3 - Initialize Bool var "if_firstTimeLaunch".
        var if_firstTimeLaunch: Bool!
        
        // 4 - Compare bool value.
        
        // 4.1 - If it is the case that there are no objects in "User_Attrib", this indicates that this is the first time of use.
        if(result_count == 0){
            if_firstTimeLaunch = true
        }
            
            // 4.2 - If it is not the case, this is indicative of persisting use.
        else{
            if_firstTimeLaunch = false
        }
        
        // 5 - Return value.
        return if_firstTimeLaunch
    }
    
    
    

    func initializeApp(){
        print("Function, \"initializeApp()\"  has been called. ")
        
        
        
        let evalValue = determineIfFirstTimeLaunch()
        
        // Case if program is being used for the first time.
        if(evalValue == true){
            print("Program has no history.")
                singleton.coreDataObject.addEntityObject("User_Attr", nameOfKey: "userName", nameOfObject: "user1")
                //letsingleton.coreDataObject.getEntityObject("User_Attr", idKey: "userName", idName: "user1")
            
            singleton.coreDataObject.setValueOfEntityObject("User_Attr", idKey: "userName", nameOfKey: "userPrefCard", idName: "user1", editName: "tapping")
            
            singleton.coreDataObject.setValueOfEntityObject("User_Attr", idKey: "userName", nameOfKey: "userPrefColor", idName: "user1", editName: "plain")
            

            
            
            
            
                singleton.setUserPrefCardInteraction("place")
                singleton.setUserPrefUIColor("default")
            
            
            
            
            // OLD STUFF
//            // 1 - WSDM creates a user setting profile.
//            
//            // 1.1 - Creates user setting object for "User Attr" entity.
//            singleton.coreDataObject.addEntityObject("User_Attr", nameOfKey: "serialPortPath", nameOfObject: "Blank")
//            
//            // 2 - WSDM launches the "Edit User Settings" window to allow the user to specify which port they want to use by default.
//            launchWindowManager(self)
        }
            
            // Case if program has been used before.
        else{
            print("Program has a history.")
            
            //Here we will pull the information from the DB to put user prefs in the singleton.
            
            var userPrefObj = [NSManagedObject]()
            
            // 1 - Get Managed Object Context
            let managedContext = singleton.coreDataObject.managedObjectContext
            
            // 2 - Establish Fetch Request
            let fetchRequest = NSFetchRequest(entityName: "User_Attr")
            
            // 3 - Attempt Fetch Request
            do {
                let results =
                    try managedContext.executeFetchRequest(fetchRequest)
                userPrefObj = results as! [NSManagedObject]
            } catch let error as NSError {
                print("Could not fetch \(error), \(error.userInfo)")
            }
            
            let userPref_UIColor = userPrefObj[0].valueForKey("userPrefColor") as? String
            let userPref_CardInter = userPrefObj[0].valueForKey("userPrefCard") as? String

            singleton.setUserPrefUIColor("\(userPref_UIColor ?? "")")
            singleton.setUserPrefCardInteraction("\(userPref_CardInter ?? "")")
           

            
            
            
            
            
            
            
            
            
            
//               let userPref = singleton.coreDataObject.getDataObjects("User_Attr")
//            
//            
//            
//            
//               let retVal = userPref[0].valueForKey("userPrefCardInter")
//                let retVal2 = userPref[0].valueForKey("userPrefUIColor")
//                print(retVal)
//                print(retVal2)
            
            
                //singleton.setUserPrefCardInteraction(singleton.coreDataObject.editEntityObject(   , nameOfKey: <#T##String#>, oldName: <#T##String#>, editName: <#T##String#>))
            
//            // - 1 WSDM loads the preferred serial port into the singleton:
//            singleton.serialPortObject = SerialPortManager(pathName: singleton.serialPath ,in_nameOfStoryBoard: "Main" ,in_nameOfWinUnAssoc:"UAWindow",  in_nameOfWinAssoc: "AWindow")
        }
        

        
        
        /*Get the path name of the serial port.*/
        let serialPortManager = ORSSerialPortManager.sharedSerialPortManager()
        let serPort = serialPortManager.availablePorts
        let selectedPort = serPort[0]
        let pthNm = "/dev/cu.\(selectedPort)"
        print( pthNm )
        
        
        /*Setting the serial port object for the singleton.*/

        singleton.serialPortObject = SerialPortManager(pathName: pthNm ,in_nameOfStoryBoard: "Main" ,in_nameOfWinUnAssoc:"UAWindow",  in_nameOfWinAssoc: "AWindow")
        
        singleton.serialPath = pthNm
        print("Function, \"initializeApp()\"  has been exited. ")
    }
 
    
    
}
