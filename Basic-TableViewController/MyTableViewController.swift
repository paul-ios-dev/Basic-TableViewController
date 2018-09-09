//
//  ViewController.swift
//  Basic-TableViewController
//
//  Created by Kang Paul on 2018/9/9.
//  Copyright © 2018年 Kang Paul. All rights reserved.
//

import UIKit

class MyTableViewController: UITableViewController {

    var itemArray: [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in 1...100 {
            itemArray.append("Item #\(i)")
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Select row at \(indexPath.row)")
        tableView.deselectRow(at: indexPath, animated: true)
    }

}

