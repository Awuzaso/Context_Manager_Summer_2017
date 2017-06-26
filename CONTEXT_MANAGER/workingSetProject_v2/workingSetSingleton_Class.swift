//
//  workingSetSingleton_Class.swift
//  workingSetProject_v2
//
//  Created by Osa on 7/5/16.
//  Copyright © 2016 Osa. All rights reserved.
//

import Cocoa

let singleton = workingSetSingleton()

class workingSetSingleton {
    
    /*Establish Singleton*/
        static let sharedInstance = workingSetSingleton()
    
    /*Objects*/
        var coreDataObject = dataCore()
        var serialPortObject: SerialPortManager!
        let openWindowObject = windowManager()
        let googleChromeObject = chromeManager()
        let desktopWindowObject = desktopWindowManger()
        let previewObject = previewManager()
    
    /*Frequently Used Variables*/
    
        // Bool variable that constrains actions on the basis if a card is present or not.
            var canAssociateVar = false
    
        // The current card that is read.
            var readCard:NSManagedObject!
    
        // The name of the currently opened working domain.
            var openedWD: String!
    
        //Path to user's prefferred serial port.
            var serialPath:String!
    
        // Variable to control if 'canAssoc' window can pop up.
            var canOpenAssocWindow = true
    
        // Variable to control if user truly wants to switch contexts.
            var OKtoSwitch = false
    
    
        // Variable to determine if card is sitting on reader or not.
            var cardIsOnReader = false
    
        // Variable for user's preferred UI color
            var userPrefUIColor: String!
    
        // Variable foe user's card interaction style.
            var userPrefCardInteractonStyle: String!
    
    /*Function for retrieving the current date in string form.*/
        func getDate(dateFormat:String)->String{
            
            // - 1 - Gets the current date.
                let currentDate = NSDate()
            
            // - 2 - Setting up date formatter.
                let dateFormatter = NSDateFormatter()
                dateFormatter.locale = NSLocale(localeIdentifier: "en_GR")
                dateFormatter.dateFormat = dateFormat
            
            // - 3 - Convert the prior date established earlier.
                var convertedDate = dateFormatter.stringFromDate(currentDate)
            
            return convertedDate
        }
    
    /*Function to get the current status of OKtoSwitch*/
    func getOKtoSwitch()->Bool{
        return OKtoSwitch
    }
    
    /*Function to set the current status of OKtoSwitch*/
        func setOKtoSwitch(inValSwitch:Bool){
            OKtoSwitch = inValSwitch
        }
    
    /*Function to set value of user UI color*/
        func setUserPrefUIColor(inVal:String){
            userPrefUIColor=inVal
        }
    /*Function to get value of user UI color*/
        func getUserPrefUIColor()->String{
            return userPrefUIColor
        }
    
    /*Function to set value of user UI card interaction style*/
        func setUserPrefCardInteraction(inVal:String){
            userPrefCardInteractonStyle = inVal
        }
    /*Function to getet value of user UI card interaction style*/
        func getUserPrefCardInteraction()->String{
            return userPrefCardInteractonStyle
        }
}
