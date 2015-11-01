//
//  ItemsTVC.swift
//  ShoppingAlarm
//
//  Created by Sunil Kumar on 16/05/2015.
//  Copyright (c) 2015 Sunil Kumar. All rights reserved.
//

import UIKit
import CoreData

class ItemsTVC: UITableViewController
{
    override func viewDidLoad() {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "managedObjectContextInitiated:",
                                                                   name:ManagedObjectContext.NotificationManagedObjectContextInitiated,
                                                                 object: nil)
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        ManagedObjectContext.sharedContext.initiateManagedObjectContext()
        super.viewWillAppear(animated)
    }

    var items :[AddNewItemTVC.NewItem] = []
    var shoppingItemsTest : [ShoppingItems]? {
        willSet(newShoppingItemsTest){
            
        }didSet(newShoppingItemsTest){
            self.tableView.reloadData()
        }
    }
   
    //MARK : IBActions
    @IBAction func addNewItem(sender: UIBarButtonItem)
    {
        print("Add item")
        performSegueWithIdentifier("AddNewItemSegue", sender: self)
    }
    
    func managedObjectContextInitiated(notification:NSNotification) {
        refresh()
    }
    
    private func refresh() {
        self.shoppingItemsTest = ShoppingItems.allShoppingItems(ManagedObjectContext.sharedContext.initiatedManagedObjectContext!) as? [ShoppingItems]
    }
}

extension ItemsTVC
{
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        print("selected\(indexPath.row)")
    }
    
}
extension ItemsTVC 
{
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if let shoppingItemsTest = self.shoppingItemsTest
        {
            return shoppingItemsTest.count;
        }
        return 0
    }
    
    override func  tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("ItemCell", forIndexPath: indexPath) as! ItemCell
        let eachItem = self.shoppingItemsTest![indexPath.row] as ShoppingItems
        cell.nameLabel.text         = eachItem.itemname
        cell.descriptionLabel.text  = eachItem.itemdescription
        cell.numberOfDaysLabel.text = eachItem.numberofdays.stringValue
        return cell
    }
}
        


//    @IBAction func unwindSegueFromAddNewItem(sender:UIStoryboardSegue){
//        println("unwind segue")
//        var addNewItemTVC: AddNewItemTVC = sender.sourceViewController as! AddNewItemTVC
//        var newItemDetails = addNewItemTVC.newItemDetails()
//        items.append(newItemDetails)
//        self.tableView.reloadData()
//    }


//if let shoppingItemsTest = self.shoppingItemsTest
//{
//    self.tableView.reloadData()
//    
//    for result: ShoppingItems in shoppingItemsTest
//    {
//        println("Name        :\(result.itemname)")
//        println("Description :\(result.itemdescription)")
//        println("Days        :\(result.numberofdays)")
//    }
//}

