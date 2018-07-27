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
    
    static func getPropertyList() -> [Month] {
        var months: [Month] = []
        
        if let path = Bundle.main.path(forResource: "Data", ofType: "plist") {
            let arrayOpt = NSArray(contentsOfFile: path)
            
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
            print("Não encontrou o arquivo Data.plist")
        }
        
//        let entries:[Entry] = months.flatMap { (month:Month) -> [Entry] in
//            month.entries.map{ (object) -> Entry in
//                object as! Entry
//            }}
//
//        let total = entries.reduce(0) { (partial, entry) -> Int in
//            partial + entry.value.intValue
//        }
//        
        return months
    }
    
    static func addPropertyList(month: Month) -> [Month] {
        var months: [Month] = getPropertyList()
        months.append(month)
        
        
        return months
    }
    
    static func addPropertyList(month: Month, entry: Entry) -> [Month] {
        let month1: Month = Month()
        month1.name = "Janeiro";
    
        let entry1: Entry = Entry()
        entry1.desc = "Bepid";
        entry1.value = 1000
    
        let entry2: Entry = Entry()
        entry2.desc = "Pizza";
        entry2.value = -50
    
        month1.entries = [entry1, entry2]
    
        let month2: Month = Month()
        month2.name = "Fevereiro";
    
        let entry3: Entry = Entry()
        entry3.desc = "Camiseta";
        entry3.value = -100
    
        let entry4: Entry = Entry()
        entry4.desc = "Pizza de peperoni";
        entry4.value = -50
        
        month2.entries = [entry3, entry4]
        
        if month1.name == month.name {
            month1.addEntry(entry)
        } else if month2.name == month.name {
            month2.addEntry(entry)
        }
    
        return [month1, month2]
    }
}
