//
//  ViewController.swift
//  LastNight
//
//  Created by Patrick Reynolds on 7/12/14.
//  Copyright (c) 2014 Patrick Reynolds. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
//    var tableView: UITableView 
    let contacts = []
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func touchDateFilter(sender: UIBarButtonItem) {
//        contacts.sort({ $0.kABPersonCreationDateProperty > $1.kABPersonCreationDateProperty })
    }
    
    @IBAction func touchCompanyFilter(sender: UIBarButtonItem) {
//        contacts.sort({ $0.kABPersonOrganizationProperty > $1.kABPersonOrganizationProperty })
    }

    @IBAction func touchJobFilter(sender: UIBarButtonItem) {
//        contacts.sort({ $0.kABPersonJobTitleProperty > $1.kABPersonJobTitleProperty })
    }
    
    func updateUI() {
        //reload the contacts
    }
    
}

