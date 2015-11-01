//
//  ManagedObjectContext.swift
//  ShoppingAlarm
//
//  Created by Sunil Kumar on 25/05/2015.
//  Copyright (c) 2015 Sunil Kumar. All rights reserved.
//

import Foundation
import CoreData
import UIKit

public class ManagedObjectContext:NSObject{
    
    public static let NotificationManagedObjectContextInitiated = "ManagedObjectContextInitiated"
    
    var url                  : NSURL?
    var error                : NSError?
    var document             : UIManagedDocument?
    var initiatedManagedObjectContext : NSManagedObjectContext? {
        willSet(newInitiatedManagedObjectContext) {
            
        }didSet(newInitiatedManagedObjectContext){
            //invoke notification
            NSNotificationCenter.defaultCenter().postNotificationName(ManagedObjectContext.NotificationManagedObjectContextInitiated, object: nil)
        }
    }
    
    static var sharedContext = ManagedObjectContext()
    
    public func initiateManagedObjectContext() 
    {
        _ = NSFileManager.defaultManager()
        self.url = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory ,inDomains:.UserDomainMask)[0]
        self.url = self.url! .URLByAppendingPathComponent("ShoppingAlarmDocument")
        print("Relative path\(self.url)")
        self.document = UIManagedDocument(fileURL: self.url!)
    
        if(!NSFileManager.defaultManager().fileExistsAtPath(self.url!.path!)){
            self.document! .saveToURL(self.url!, forSaveOperation:.ForCreating, completionHandler: { (BOOL success) -> Void in
                if(success){
                    self.initiatedManagedObjectContext = self.document!.managedObjectContext
                    print("Success: Document Creation")
                }
                else{
                    print("Failure : Document Creation")
                }
            })
        }
        else if(self.document!.documentState == .Closed){
            self.document! .openWithCompletionHandler({ (BOOL success) -> Void in
                if(success){
                    self.initiatedManagedObjectContext = self.document!.managedObjectContext
                    print("Success : Document Open")
                    
                }
                else{
                    print("Failure : Document open")
                }
            })
        }
        else{
            print("Success ");
            self.initiatedManagedObjectContext = self.document!.managedObjectContext;
        }
    }
}
