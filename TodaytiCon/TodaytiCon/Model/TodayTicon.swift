//
//  TodayTicon.swift
//  TodaytiCon
//
//  Created by 정창용 on 2020/12/09.
//

import Foundation

struct TodayTicon: Codable {
    var caring_id: String = ""
    var date: String = ""
    var feel: String
    var body: String
    
    init(date: String, feel: String, body: String) {
        self.date = date
        self.feel = feel
        self.body = body
        
    }
    
}
