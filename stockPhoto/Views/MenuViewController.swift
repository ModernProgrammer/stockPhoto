//
//  MenuViewController.swift
//  stockPhoto
//
//  Created by Diego Bustamante on 1/27/19.
//  Copyright © 2019 Diego Bustamante. All rights reserved.
//

import UIKit

class MenuViewController: UITableViewController {
    let cellId = "cellId"
    let headerId = "headerId"

    let titles = ["Home", "Saved", "Profile"]
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
//        tableView.tableHeaderView = UIView()
        tableView.backgroundColor = .white
        tableView.tableFooterView = UIView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        tableView.register(UITableViewHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: headerId)
    }
}

// MARK: UITableView Functions
extension MenuViewController {
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Stock Photo"
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        cell.textLabel?.text = titles[indexPath.item]
        return cell
    }
}

