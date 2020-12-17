//
//  MainListTableViewController.swift
//  TodaytiCon
//
//  Created by 정창용 on 2020/12/04.
//

import UIKit

class MainListTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var mainListTableView: UITableView!
    @IBOutlet weak var saveBtn: UIButton!
    
    let cellIdentifier: String = "mainCell"
    let httpClient = HTTPClient()
    private var resultModel: TimeLineResult = TimeLineResult()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidLayoutSubviews() {
        setLineBtn(saveBtn)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todayTicon.count + 1
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MainListTableViewCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! MainListTableViewCell
        
        cell.dateLabel?.text = "Disconnect"
        cell.feelLabel?.text = "🤬"
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
        
    }
    
    func setLineBtn(_ numOfBtn: UIButton) {
        numOfBtn.layer.borderColor = UIColor.black.cgColor
        numOfBtn.layer.borderWidth = 1.5
        numOfBtn.layer.cornerRadius = 33.5
        
    }

}

