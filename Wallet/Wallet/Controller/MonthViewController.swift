//
//  MonthViewController.swift
//  Wallet
//
//  Created by Julianny Favinha on 7/25/18.
//  Copyright © 2018 Julianny Favinha. All rights reserved.
//

import UIKit


class MonthViewController: UIViewController {
    
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var monthTotalLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var month: Month!
    
    var services: Services = Services()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.monthLabel.text = month.name
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(MonthViewController.addItem))
        self.navigationItem.rightBarButtonItem = addButton
        
        updateTotal()
        
        services.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        services.retrieveMonth(month.name)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func updateTotal() {
        self.monthTotalLabel.text = month.sumEntries().stringValue
    }
    
    @objc private func addItem() {
        performSegue(withIdentifier: "SegueNewItem", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nav = segue.destination as? UINavigationController
        if let destiny = nav?.topViewController as? NewItemTableViewController {
            destiny.month = self.month
        }
    }
}

extension MonthViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.month.entries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MonthCell", for: indexPath)
        
        let entry = self.month.entries[indexPath.row] as! Entry
        cell.textLabel?.text = entry.desc
        cell.detailTextLabel?.text = entry.value.stringValue
        
        return cell
    }
}

extension MonthViewController: ServicesDelegate {
    func didReceive(_ month: Month!) {
        self.month = month
        updateTotal()
        self.tableView.reloadData()
    }
}
