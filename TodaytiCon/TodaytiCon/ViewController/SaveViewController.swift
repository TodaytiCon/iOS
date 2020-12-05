//
//  SaveViewController.swift
//  TodaytiCon
//
//  Created by 정창용 on 2020/12/04.
//

import UIKit

class SaveViewController: UIViewController {
    @IBOutlet weak var dateTF: UITextField!
    @IBOutlet weak var feelTF: UITextField!
    @IBOutlet weak var sunnyBtn: UIButton!
    @IBOutlet weak var cloudyBtn: UIButton!
    @IBOutlet weak var rainyBtn: UIButton!
    @IBOutlet weak var snowyBtn: UIButton!
    @IBOutlet weak var memoTV: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidLayoutSubviews() {
        setUnderLineTF(dateTF)
        setUnderLineTF(feelTF)
        
        setUnderLineBtn(sunnyBtn)
        setUnderLineBtn(cloudyBtn)
        setUnderLineBtn(rainyBtn)
        setUnderLineBtn(snowyBtn)
        
    }
    
    func setUnderLineTF(_ numOfTF: UITextField) {
        let border = CALayer()
        let width = CGFloat(1.5)
        border.borderColor = UIColor.black.cgColor
        border.frame = CGRect(x: 0, y: numOfTF.frame.size.height - width, width: numOfTF.frame.size.width, height: numOfTF.frame.size.height)
               
        border.borderWidth = width
        numOfTF.layer.addSublayer(border)
        numOfTF.layer.masksToBounds = true
        
    }
    
    func setUnderLineBtn(_ numOfBtn: UIButton) {
        numOfBtn.layer.borderColor = UIColor.black.cgColor
        numOfBtn.layer.borderWidth = 1.5
        numOfBtn.layer.cornerRadius = 15
        
    }
    
    func setUnderLineTV(_ numOfTV: UITextView) override func removeFromParent() {
        <#code#>
    }
    
}

