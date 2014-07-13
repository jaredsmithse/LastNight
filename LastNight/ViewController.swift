//
//  ViewController.swift
//  LastNight
//
//  Created by Patrick Reynolds on 7/12/14.
//  Copyright (c) 2014 Patrick Reynolds. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        println("View did load")
        var contacts = AddressBookWrapper.getContacts()
        println("Passed contacts")
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
    
    func updateUI() {
        //reload the contacts
    }
    
}

