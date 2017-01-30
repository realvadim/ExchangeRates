//
//  ViewController.swift
//  ExchangeRates
//
//  Created by Vadim Miropolskiy on 1/29/17.
//  Copyright © 2017 Gagarin Avenue Home. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    var rateList = ["RUB", "USD", "GBP", "EUR"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        title = "Rates list"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return rateList.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "rateName", for: indexPath)
        
        // Configure the cell...
        cell.textLabel?.text = rateList[indexPath.row]
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "HomeToDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let destinationViewController = segue.destination as! DetailTableViewController
                destinationViewController.baseCurrency = rateList[indexPath.row]
            }
        }
    }
}

