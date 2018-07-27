//
//  NewItemTableViewController.swift
//  Wallet
//
//  Created by Julianny Favinha on 7/24/18.
//  Copyright © 2018 Julianny Favinha. All rights reserved.
//

import UIKit

class NewItemTableViewController: UITableViewController {

    @IBOutlet weak var valueTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var typeSegmentedControl: UISegmentedControl!
    @IBOutlet weak var paymentSegmentedControl: UISegmentedControl!
    
    var services: Services = Services()
    
    var month: Month!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // clean empty lines of table view
        self.tableView.tableFooterView = UIView()
        
        self.services.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveButtonPressed(_ sender: UIBarButtonItem) {
        let entry: Entry = Entry()
        entry.num = 0 // TODO
        entry.desc = self.descriptionTextField.text
        entry.date = self.datePicker.date
        entry.type = self.typeSegmentedControl.titleForSegment(at: self.typeSegmentedControl.selectedSegmentIndex)
        if entry.type == "Despesa" {
            entry.value = NSNumber(value: -Float(self.valueTextField.text!)!)
        } else {
            entry.value = NSNumber(value: Float(self.valueTextField.text!)!)
        }
        entry.payment = self.paymentSegmentedControl.titleForSegment(at: self.paymentSegmentedControl.selectedSegmentIndex)
        
        self.services.addEntry(month, entry)
        
        self.dismiss(animated: true, completion: nil)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
}

extension NewItemTableViewController: ServicesDelegate {
    func didAddEntry(_ months: [Month]!) {
        print("didAddEntry")
    }
}
