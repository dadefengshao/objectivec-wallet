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
    
    var month: Month!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.monthLabel.text = month.month
        
        updateTotal()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    private func updateTotal() {
        self.monthTotalLabel.text = month.sumEntries().stringValue
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
