//
//  ShoppingItemsExtension.swift
//  ShoppingAlarm
//
//  Created by Sunil Kumar on 26/05/2015.
//  Copyright (c) 2015 Sunil Kumar. All rights reserved.
//

import Foundation
import CoreData

extension ShoppingItems
{
    class func addShoppingItem(item:AddNewItemTVC.NewItem ,context:NSManagedObjectContext)
    {
        var shoppingtItem : ShoppingItems?
        
        shoppingtItem = NSEntityDescription.insertNewObjectForEntityForName(Constant.ENTITY_SHOPPING_ITEMS, inManagedObjectContext: context) as? ShoppingItems
        
        if let shoppingItem = shoppingtItem{
            shoppingtItem!.itemname        = item.name
            shoppingtItem!.itemdescription = item.description
            shoppingtItem!.numberofdays    =  NSNumber(integer: Int(item.numberOfDays)!)
            var error:NSError? = nil
            do {
                try context.save()
            } catch let error1 as NSError {
                error = error1
            }
        }
        
        
    }
    class func allShoppingItems(context:NSManagedObjectContext) -> Array<AnyObject>?
    {
        var error:NSError? = nil
        let fetchRequest = NSFetchRequest(entityName:Constant.ENTITY_SHOPPING_ITEMS)
        
        var shoppingItems: [AnyObject]?
        do {
            shoppingItems = try context.executeFetchRequest(fetchRequest)
        } catch let error1 as NSError {
            error = error1
            shoppingItems = nil
        }
        
        if(shoppingItems != nil){
            return shoppingItems!
        }
        else{
            return nil
        }
    }
}