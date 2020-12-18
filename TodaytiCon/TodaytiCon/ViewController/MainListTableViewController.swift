//
//  MainListTableViewController.swift
//  TodaytiCon
//
//  Created by 정창용 on 2020/12/04.
//

import UIKit

protocol abc {
    func sendDate(data: String)
    func sendFeel(data: String)
    func sendBody(data: String)

}

class MainListTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var mainListTableView: UITableView!
    @IBOutlet weak var saveBtn: UIButton!
    
    @IBAction func logoutButton(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    var date: String = ""
    var feel: String = ""
    var count: Int = 0
    
    let cellIdentifier: String = "mainCell"
    let httpClient = HTTPClient()
    var delegate: abc?
    
    private var resultModel: TimeLineResult = TimeLineResult()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidLayoutSubviews() {
        setLineBtn(saveBtn)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        mainListTableView.reloadData()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MainListTableViewCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! MainListTableViewCell
        
        cell.dateLabel?.text = date
        cell.feelLabel?.text = feel
        
        if let data = cell.dateLabel.text {
            delegate?.sendDate(data: data)
            
        }
        
        if let data = cell.feelLabel.text {
            delegate?.sendFeel(data: data)
            
        }
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
        
    
    }
    
    @IBAction func saveBtnAction (_ sender: Any) {
        count += 1
        print(count)
        
    }
    
    func setLineBtn(_ numOfBtn: UIButton) {
        numOfBtn.layer.borderColor = UIColor.black.cgColor
        numOfBtn.layer.borderWidth = 1.5
        numOfBtn.layer.cornerRadius = 33.5
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Save" {
            let viewController: SaveViewController = segue.destination as! SaveViewController
            viewController.delegate = self

        }
        
    }

}

extension MainListTableViewController : SendDataDelegate {
    func sendDate(data: String) {
        date = data
        
    }
    
    func sendFeel(data: String) {
        feel = data
        
    }
    
}

