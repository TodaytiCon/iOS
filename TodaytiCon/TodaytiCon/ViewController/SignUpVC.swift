//
//  SignUpVC.swift
//  TodaytiCon
//
//  Created by 장서영 on 2020/12/04.
//

import UIKit
import Alamofire

class SignUpVC: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var nameTextField : UITextField!{
        didSet{
            nameTextField.delegate = self
        }
    }
    @IBOutlet weak var emailTextField : UITextField!{
        didSet{
            emailTextField.delegate = self
        }
    }
    @IBOutlet weak var pwTextField : UITextField!{
        didSet{
            pwTextField.delegate = self
            pwTextField.isSecureTextEntry = true
        }
    }
    @IBOutlet weak var confirmTextField : UITextField!{
        didSet{
            confirmTextField.delegate = self
            confirmTextField.isSecureTextEntry = true
        }
    }
    @IBOutlet weak var confirmSubLabel : UILabel!
    
    @IBOutlet weak var signUpButton : UIButton!
    
    @IBOutlet weak var confirmLine : UIView!
    
    @IBOutlet weak var confirmTitleLabel : UILabel!
    
    @IBAction func signUpButton(_ sender : UIButton){
        if pwTextField.text != confirmTextField.text{
            confirmSubLabel.isHidden = false
            confirmTitleLabel.textColor = UIColor.red
            confirmLine.backgroundColor = UIColor.red
            confirmTextField.textColor = UIColor.red
            return
        }
        else{
            let alert = UIAlertController(title: "계정을 생성하시겠습니까?", message: nil, preferredStyle: UIAlertController.Style.alert)
            
            let cancelAction = UIAlertAction(title: "취소", style: .default, handler: nil)
            let createAction = UIAlertAction(title: "생성", style: .default){
                (action) in //회원가입 서버 어쩌구
                
                self.signUp(name: self.nameTextField.text!, email: self.emailTextField.text!, password: self.pwTextField.text!)
                
            }
            
            alert.addAction(cancelAction)
            alert.addAction(createAction)
            
            present(alert, animated: true, completion: nil)
        }

    }
    
    let httpclient = HTTPClient()
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameTextField.resignFirstResponder()
        emailTextField.resignFirstResponder()
        pwTextField.resignFirstResponder()
        confirmTextField.resignFirstResponder()
        return true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        makeBorderLine(signUpButton)
        
        confirmSubLabel.textColor = UIColor.red
        confirmSubLabel.isHidden = true
        
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillAppear(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillDisappear(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    @objc func keyboardWillAppear(_ sender : NotificationCenter){
        //self.view.frame.origin.y -= 50
    }
    
    @objc func keyboardWillDisappear(_ sender : NotificationCenter){
        //self.view.frame.origin.y += 50
    }

    func makeBorderLine(_ button : UIButton){
        button.layer.borderWidth = 2.0
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.cornerRadius = 15
        
    }
    
    func signUp(name : String, email : String, password : String){
        httpclient.post(.SignUp(name, email, password)).responseJSON(completionHandler: {
            reponse in
            switch reponse.response?.statusCode{
            case 201 :
                print("success")
                
                let alert = UIAlertController(title: "회원가입에 성공하셨습니다.", message: nil, preferredStyle: UIAlertController.Style.alert)
                
                let cancelAction = UIAlertAction(title: "확인", style: .default,  handler: {
                    (action )in self.navigationController?.popViewController(animated: true)
                })
                
                alert.addAction(cancelAction)
                
                self.present(alert, animated: true, completion: nil)
                
            default :
                print("아 몰라몰라몰라")
            }
        })
        
        
        
//        let url = "http://caratserver.pythonanywhere.com/user"
//        let param : Parameters = [
//            name : "name",
//            email : "email",
//            password : "password"
//        ]
//
//        let call = AF.request(url, method: .post, parameters: param, encoding: JSONEncoding.default)
//
//        call.responseJSON{
//            res in
//
//            switch res.response?.statusCode {
//            case 200 :
//                print("회원가입 성공")
//                let alert = UIAlertController(title: "회원가입에 성공하셨습니다.", message: nil, preferredStyle: UIAlertController.Style.alert)
//
//                let cancelAction = UIAlertAction(title: "확인", style: .default,  handler: nil)
//
//                alert.addAction(cancelAction)
//
//                self.present(alert, animated: true, completion: nil)
//
//                self.navigationController?.popViewController(animated: true)
//
//
//            default :
//                print("회원가입에 실패했습니다.\(res.result)")
//                print(res.response?.statusCode)
//
//            }
        }
    }
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


