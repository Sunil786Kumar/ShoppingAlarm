//
//  ShoppingItems.swift
//  ShoppingAlarm
//
//  Created by Sunil Kumar on 31/05/2015.
//  Copyright (c) 2015 Sunil Kumar. All rights reserved.
//

import Foundation
import CoreData

class ShoppingItems: NSManagedObject {

    @NSManaged var itemname: String
    @NSManaged var itemdescription: String
    @NSManaged var numberofdays: NSNumber

}
