//
//  DetailViewController.swift
//  TodaytiCon
//
//  Created by 정창용 on 2020/12/09.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var feelLabel: UILabel!
    
    var date: String = ""
    var feel: String = ""
    var body: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func deleteBtn(_ sender: UIBarButtonItem) {
        todayTicon.remove(at: sender.tag)
        
    }
    
    
    
}

