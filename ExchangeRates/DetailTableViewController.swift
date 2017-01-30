//
//  DetailTableViewController.swift
//  ExchangeRates
//
//  Created by Vadim Miropolskiy on 1/30/17.
//  Copyright © 2017 Gagarin Avenue Home. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class DetailTableViewController: UITableViewController {
    var rateNames: [String] = []
    var rateValues: [String] = []
    var baseCurrency = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = "https://api.fixer.io/latest?base=\(baseCurrency)"
        title = "Base currency: \(baseCurrency)"
        Alamofire.request(url).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print("JSON: \(json)")
                for (key, value) in json["rates"] {
                    print("ADDING")
                    self.rateNames.append(key)
                    self.rateValues.append(String(describing: value))
                }
                self.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("OLALA: \(rateValues.count)")
        return rateValues.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell", for: indexPath)

        cell.textLabel?.text = "\(rateNames[indexPath.row])"
        cell.detailTextLabel?.text = "\(rateValues[indexPath.row])"

        return cell
    }
}
