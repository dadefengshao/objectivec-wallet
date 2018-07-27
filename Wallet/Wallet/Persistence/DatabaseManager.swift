//
//  DatabaseManager.swift
//  Wallet
//
//  Created by Julianny Favinha on 7/26/18.
//  Copyright © 2018 Julianny Favinha. All rights reserved.
//

import Foundation

@objcMembers
class DatabaseManager: NSObject {
    private override init() {
    }
    
    static func hasPropertyList() -> Bool {
        let fileManager = (FileManager.default)
        let path = getPathOfPropertyList()
        
        return fileManager.fileExists(atPath: path)
    }
    
    static func getPathOfPropertyList() -> String {
        let directories: [String]? = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory,FileManager.SearchPathDomainMask.allDomainsMask, true)
    
        if let directories = directories {
            return directories[0] + "/Data.plist"
        }
    
        return ""
    }
    
    static func getPropertyList() -> [Month] {
        var months: [Month] = []
        
        if hasPropertyList() {
            print("hasPropertyList: true")
            let arrayOpt = NSArray(contentsOfFile: getPathOfPropertyList())
            
            if let array = arrayOpt {
                for elem in array {
                    let elemDict = elem as! NSDictionary
                    let month: Month = Month()
                    
                    if let num = elemDict["num"] {
                        month.num = num as! NSNumber
                    }
                    if let name = elemDict["name"] {
                        month.name = name as! String
                    }
                    
                    let entriesArray = elemDict["entries"] as! NSArray
                    
                    for elem in entriesArray {
                        let elemDict = elem as! NSDictionary
                        let entry: Entry = Entry()
                        
                        if let num = elemDict["num"] {
                            entry.num = num as! NSNumber
                        }
                        if let value = elemDict["value"] {
                            entry.value = value as! NSNumber
                        }
                        if let desc = elemDict["desc"] {
                            entry.desc = desc as! String
                        }
                        if let date = elemDict["date"] {
                            entry.date = date as! Date
                        }
                        if let type = elemDict["type"] {
                            entry.type = type as! String
                        }
                        if let payment = elemDict["payment"] {
                            entry.payment = payment as! String
                        }
                        
                        month.addEntry(entry)
                    }
                    
                    months.append(month)
                }
            }
        } else {
            // create plist file
            print("hasPropertyList: false")
            
            let path = getPathOfPropertyList()
            
            let arrayContent: [NSDictionary] = []
            let plistContent = NSArray(array: arrayContent)
            
            let created = plistContent.write(toFile: path, atomically: false)
            if created {
                print("Created \(path)")
            }
        }
        
//        let entries:[Entry] = months.flatMap { (month:Month) -> [Entry] in
//            month.entries.map{ (object) -> Entry in
//                object as! Entry
//            }}
//
//        let total = entries.reduce(0) { (partial, entry) -> Int in
//            partial + entry.value.intValue
//        }
      
        return months
    }
    
    static func addPropertyList(month: Month) -> [Month] {
        var months: [Month] = getPropertyList()
        months.append(month)

        let path = getPathOfPropertyList()
        let arrayOpt = NSMutableArray(contentsOfFile: path)
        
        if let array = arrayOpt {
            let dictEntry: [NSDictionary] = []
            let dictMonth: NSDictionary = ["num": month.num, "name": month.name, "entries": dictEntry]
            array.add(dictMonth)
            let added = array.write(toFile: path, atomically: false)
            if added {
                print("Added month to \(path)")
            }
        }
        
        return months
    }
    
    static func addPropertyList(month: Month, entry: Entry) -> [Month] {
        let months: [Month] = getPropertyList()
        
        for m in months where m.name == month.name {
            m.entries.add(entry)
        }
        // recreate the plist using memory objects
        let path = getPathOfPropertyList()
        let arrayOpt = NSMutableArray(contentsOfFile: path)
        
        if let array = arrayOpt {
            for elem in array {
                let elemDict = elem as! NSDictionary
                let entriesArray = elemDict["entries"] as! NSMutableArray
                let name = elemDict["name"] as! String
                
                if name == month.name {
                    var dictEntry: [String:Any] = [:]
                    dictEntry["num"] = entry.num
                    dictEntry["value"] = entry.value
                    dictEntry["desc"] = entry.desc
                    dictEntry["date"] = entry.date
                    dictEntry["type"] = entry.type
                    dictEntry["payment"] = entry.payment
                    entriesArray.add(dictEntry)
                }
            }
            
            array.write(toFile: path, atomically: false)
        }
        
        return months
    }
}
