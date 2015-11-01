//
//  AddNewItemTVC.swift
//  ShoppingAlarm
//
//  Created by Sunil Kumar on 17/05/2015.
//  Copyright (c) 2015 Sunil Kumar. All rights reserved.
//

import UIKit
import CoreData

class AddNewItemTVC: UITableViewController {

    @IBOutlet var itemNameTextField     : UITextField!
    @IBOutlet var descriptionTextField  : UITextField!
    @IBOutlet var numberOfDaysTextField : UITextField!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    //MARK:Struct
    struct NewItem
    {
        var name,description,numberOfDays : String
        init(name:String, description:String,numberOfDays:String){
            self.name          = name
            self.description   = description
            self.numberOfDays  = numberOfDays
        }
    }
    
    func newItemDetails()->NewItem{
        return NewItem(name: itemNameTextField.text!,
                description: descriptionTextField.text!,
               numberOfDays: numberOfDaysTextField.text!)
    }
    
    @IBAction func save(sender: UIBarButtonItem) {
        ShoppingItems.addShoppingItem(newItemDetails(), context: ManagedObjectContext.sharedContext.document!.managedObjectContext)
    }
  
}
extension AddNewItemTVC{
    
}
extension AddNewItemTVC{

}