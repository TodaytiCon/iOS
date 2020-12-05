//
//  MainListTableViewController.swift
//  TodaytiCon
//
//  Created by 정창용 on 2020/12/04.
//

import UIKit

class MainListTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var mainListTableView: UITableView!
    
    let cellIdentifier: String = "mainCell"
    
    let testLabel: String = "Test"
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MainListTableViewCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! MainListTableViewCell
        
        cell.dateLabel?.text = testLabel
        cell.feelLabel?.text = "🤬"
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
        
    }
    
}

