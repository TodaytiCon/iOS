//
//  SaveViewController.swift
//  TodaytiCon
//
//  Created by 정창용 on 2020/12/04.
//

import UIKit

var todayTicon = [TodayTicon]()

protocol SendDataDelegate {
    func sendDate(data: String)
    func sendFeel(data: String)

}

protocol SendDataDelegatee {
    func sendBody(data: String)

}

class SaveViewController: UIViewController {
    @IBOutlet weak var dateTF: UITextField!
    @IBOutlet weak var feelTF: UITextField!
    @IBOutlet weak var sunnyBtn: UIButton!
    @IBOutlet weak var cloudyBtn: UIButton!
    @IBOutlet weak var rainyBtn: UIButton!
    @IBOutlet weak var snowyBtn: UIButton!
    @IBOutlet weak var memoTV: UITextView!
    
    var delegate: SendDataDelegate?
    var delegatee: SendDataDelegatee?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidLayoutSubviews() {
        setUnderLineTF(dateTF)
        setUnderLineTF(feelTF)
        
        setLineBtn(sunnyBtn)
        setLineBtn(cloudyBtn)
        setLineBtn(rainyBtn)
        setLineBtn(snowyBtn)
        
        setLineTV(memoTV)
        
    }
    
    @IBAction func addButtonAction(_ sender: Any) {
        if let data = dateTF.text {
            delegate?.sendDate(data: data)
            dismiss(animated: true, completion: nil)
            print(data)
            
        }
        
        if let data = feelTF.text {
            delegate?.sendFeel(data: data)
            dismiss(animated: true, completion: nil)
            print(data)
            
        }
        
        if let data = memoTV.text {
            delegatee?.sendBody(data: data)
            dismiss(animated: true, completion: nil)

        }
        
        self.navigationController?.popViewController(animated : true)
        
    }
    
    @IBAction func sunnyBtnAction(_ sender: Any) {
        sunnyBtn.layer.borderColor = UIColor.blue.cgColor
        cloudyBtn.layer.borderColor = UIColor.black.cgColor
        rainyBtn.layer.borderColor = UIColor.black.cgColor
        snowyBtn.layer.borderColor = UIColor.black.cgColor
        
    }
    
    @IBAction func cloudyBtnAction(_ sender: Any) {
        sunnyBtn.layer.borderColor = UIColor.black.cgColor
        cloudyBtn.layer.borderColor = UIColor.blue.cgColor
        rainyBtn.layer.borderColor = UIColor.black.cgColor
        snowyBtn.layer.borderColor = UIColor.black.cgColor

    }

    @IBAction func rainyBtnAction(_ sender: Any) {
        sunnyBtn.layer.borderColor = UIColor.black.cgColor
        cloudyBtn.layer.borderColor = UIColor.black.cgColor
        rainyBtn.layer.borderColor = UIColor.blue.cgColor
        snowyBtn.layer.borderColor = UIColor.black.cgColor

    }

    @IBAction func snowyBtnAction(_ sender: Any) {
        sunnyBtn.layer.borderColor = UIColor.black.cgColor
        cloudyBtn.layer.borderColor = UIColor.black.cgColor
        rainyBtn.layer.borderColor = UIColor.black.cgColor
        snowyBtn.layer.borderColor = UIColor.blue.cgColor

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
    
    func setLineBtn(_ numOfBtn: UIButton) {
        numOfBtn.layer.borderColor = UIColor.black.cgColor
        numOfBtn.layer.borderWidth = 1.5
        numOfBtn.layer.cornerRadius = 15
        
    }
    
    func setLineTV(_ numOfTV: UITextView) {
        numOfTV.layer.borderColor = UIColor.black.cgColor
        numOfTV.layer.borderWidth = 1.5
        numOfTV.layer.cornerRadius = 15
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        
    }
    
}

