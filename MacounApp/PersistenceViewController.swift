//
//  SecondViewController.swift
//  MacounApp
//
//  Created by Manu Rink on 04.10.17.
//  Copyright © 2017 microsoft. All rights reserved.
//

import UIKit
import SQLite

class PersistenceViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    var items : [String] = []
    
    var db = try! Connection()
    let users = Table("users")
    let id = Expression<Int64>("id")
    let name = Expression<String?>("name")
    let email = Expression<String?>("email")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fm = FileManager.default
        let docsurl = try! fm.url(for:.documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        let myurl = docsurl.appendingPathComponent("db.sqlite3")
        
        db = try! Connection(myurl.absoluteString)
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.font = UIFont(name: "Helvetica", size: 14)
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }

    @IBAction func createTable(_ sender: Any) {
        try! db.run(users.create(ifNotExists: true) { t in
            t.column(id, primaryKey: true)
            t.column(name)
            t.column(email)
        })
    }
    
    @IBAction func addRow(_ sender: Any) {
        let insert = users.insert(name <- "Manu", email <- "marink@microsoft.com")
        let rowid = try! db.run(insert)
        print("inserted \(rowid) into table -users-")
    }
    
    @IBAction func refreshTable(_ sender: Any) {
        items.removeAll()
        
        for user in try! db.prepare(users) {
            let entry = "id: \(user[id]), name: \(user[name]!), mail: \(user[email]!)"
            items.append(entry)
        }
        
        tableView.reloadData()
    }
    
    @IBAction func cleanTable(_ sender: Any) {
        items.removeAll()
        try! db.run(users.delete())
    }
}

