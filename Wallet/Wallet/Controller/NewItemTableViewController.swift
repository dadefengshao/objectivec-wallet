//
//  NewItemTableViewController.swift
//  Wallet
//
//  Created by Julianny Favinha on 7/24/18.
//  Copyright © 2018 Julianny Favinha. All rights reserved.
//

import UIKit

class NewItemTableViewController: UITableViewController {

    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var typeSegmentedControl: UISegmentedControl!
    @IBOutlet weak var categoryPicker: UIPickerView!
    @IBOutlet weak var paymentSegmentedControl: UISegmentedControl!
    
    let categories: [String] = ["Sem categoria",
                                "Alimentação",
                                "Aluguel",
                                "Farmácia",
                                "Lazer",
                                "Salário",
                                "Saúde",
                                "Telefonia",
                                "Transporte",
                                "Vestuário"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // clean empty lines of table view
        self.tableView.tableFooterView = UIView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveButtonPressed(_ sender: UIBarButtonItem) {
        // TODO
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
}

extension NewItemTableViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.categories.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return categories[row]
    }
}
