//
//  MainListTableViewCell.swift
//  TodaytiCon
//
//  Created by 정창용 on 2020/12/04.
//

import UIKit

class MainListTableViewCell: UITableViewCell {
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var feelLabel: UILabel!
    
    let httpClient = HTTPClient()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }

}

