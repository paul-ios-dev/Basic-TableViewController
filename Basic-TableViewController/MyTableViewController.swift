//
//  ViewController.swift
//  Basic-TableViewController
//
//  Created by Kang Paul on 2018/9/9.
//  Copyright © 2018年 Kang Paul. All rights reserved.
//
//Angella Yu 使用新增 TableView Controller 的方法(這個方法不能改變 TableView 為非“全螢幕”？):
//1. 在 Main.Storyboard 中加入一個新的 TableViewController
//2. 將新的 TableViewController 設為 Initial View Controller，把 Main.Storyboard 中的向右箭頭從原先的 ViewController 拉到 TableViewController，或在 TableViewController 的 Attribute Inspector 中設定勾選 Is Initial View Controller。
//3. 在 Main.Storyboard 中刪除 ViewController。
//4. 將 ViewController.swift 改名為 TodoLsitViewController.swift，並將 class 宣告改為
//      class TodoListViewController: UITableViewController {...}
//5. 在 Main.Storyboard 中選擇 TableViewController，到 Identity Inspector  將 custom class 設定為 TodoLsitViewController。
//6. 在 Main.Storyboard 中選擇 Table View Cell(Prototype Cells)，在  attribute inspector 將 Identifier 欄位設為 ToDoItemCell。(欄位空白會有 Warning)
//7. 在 ViewController.swift 中，
//   7.a 宣告要在 TableViewCell 顯示的字串陣列，itemArray。
//   7.b 在 viewDidLoad() 中設定 tableView 中 dataSource 和 delegate 為 self。
//   7.c 在 viewDidLoad() 中初始 itemArray。
//   7.d 實作 tableView dataSource protocol 的 numberOfRowInSection，傳回 itemArray 內項目的個數。
//   7.e 實作 tableView dataSource protocol 的 cellForRowAt，會用到奇怪的 dequeReusableCell 見這裡說明。
//   7.f 實作 tableView delegate protocol 的 didSelectRowAt，這裡只 print 訊息，然後[optional] deselect 該 row。


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

