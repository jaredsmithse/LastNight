//
//  ViewController.swift
//  LastNight
//
//  Created by Patrick Reynolds on 7/12/14.
//  Copyright (c) 2014 Patrick Reynolds. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var tableView: ContactListViewController? = nil
    var contacts = AddressBookWrapper.getContactsForSearchType()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let controllers = self.childViewControllers {
            self.tableView = controllers[controllers.endIndex-1].topViewController as? ContactListViewController
        }

        println("\(self.childViewControllers.count)")
//        for info in contacts {
//            println("Info: \(info)")
//        }
        
    }

    
    @IBAction func touchFilterButton(sender: UIBarButtonItem){
        let title = sender.title
        switch String(title) {
        case "Date":
            println("picked date")
//            contacts.sort({ $0.kABPersonCreationDateProperty > $1.kABPersonCreationDateProperty })
        case "Company":
            println("picked company")
//            contacts.sort({ $0.kABPersonOrganizationProperty > $1.kABPersonOrganizationProperty })
        case "Job":
            println("picked job")
//            contacts.sort({ $0.kABPersonJobTitleProperty > $1.kABPersonJobTitleProperty })
        default:
            println("button not recognized")
        }
    }

    
}

