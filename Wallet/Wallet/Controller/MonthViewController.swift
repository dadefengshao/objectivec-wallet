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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
