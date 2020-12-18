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
    @IBOutlet weak var bodyTV: UITextView!
    
    var date: String = "2020.09.03"
    var feel: String = "😭"
    var body: String = "오늘은 너무 기분이 좋았다!"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        dateLabel.text = date
        feelLabel.text = feel
        bodyTV.text = body
        
    }
    
}

extension DetailViewController : abc {
    func sendDate(data: String) {
        date = data
        
    }
    
    func sendFeel(data: String) {
        feel = data
        
    }
    
}

extension DetailViewController: SendDataDelegatee {
    func sendBody(data: String) {
        body = data
    }
    
}

