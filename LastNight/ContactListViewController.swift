//
//  ContactListViewController.swift
//  LastNight
//
//  Created by Jared Smith on 7/16/14.
//  Copyright (c) 2014 Patrick Reynolds. All rights reserved.
//

import UIKit

class ContactListViewController: UITableViewController {
    
    var contacts = [Contact]()
    
    
    override func viewDidLoad() {
        let retreivedContacts = AddressBookWrapper.getContactsForSearchType()
        super.viewDidLoad()
        for contact in retreivedContacts {
            var newContact = Contact(firstName: contact[0] as String, lastName: contact[1] as String, createdAt: contact[2] as NSDate)
            contacts.append(newContact)
        }
        updateUI()
    }
    
    func updateContacts(newContacts: [Contact]) {
        self.contacts = newContacts
        self.tableView.reloadData()
    }
    
    func updateUI() {
        let indexPath = NSIndexPath(forRow: contacts.count - 1, inSection: 0)
        self.tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
    }
    
    // #pragma mark - Table View
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
        
        let contact = contacts[indexPath.row]
//        cell.textLabel.text = contact.description
        cell.textLabel.text = contact.fullName()
        return cell
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            contacts.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if UIDevice.currentDevice().userInterfaceIdiom == .Pad {
            let contact = contacts[indexPath.row]
//            self.detailViewController!.detailItem = contact
        }
    }

    
}


