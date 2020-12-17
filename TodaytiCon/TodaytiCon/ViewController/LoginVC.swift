//
//  LoginVC.swift
//  TodaytiCon
//
//  Created by 장서영 on 2020/12/04.
//

import UIKit
import Alamofire

struct LoginModel: Codable{
    let token : String
}

class LoginVC: UIViewController {
    
    @IBOutlet weak var emailTextField : UITextField!
    @IBOutlet weak var pwTextField : UITextField!{
        didSet{
            pwTextField.isSecureTextEntry = true
        }
    }
    
    @IBOutlet weak var signUpButton : UIButton!
    @IBOutlet weak var loginButton : UIButton!
    
    @IBAction func loginButton(_ sender : UIButton){
        login(email: emailTextField.text!, password: pwTextField.text!)
    }
    
    let httpclient = HTTPClient()
    private var model : LoginModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        makeBorderLine(signUpButton)
        makeBorderLine(loginButton)
    }
    
    func makeBorderLine(_ button : UIButton){
        button.layer.borderWidth = 2.0
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.cornerRadius = 15
        
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func login(email : String, password : String){
        httpclient.post(.Login(email, password)).responseJSON(completionHandler: {(response) in
            switch response.response?.statusCode{
            case 200 :
                print("로그인 성공")
//                self.navigationController?.pushViewController(mainTableViewController, animated: true)
                guard let data = response.data else {return}
                guard let model = try? JSONDecoder().decode(LoginModel.self, from: data) else { return }
                self.model = model
            default :
                print("나도몰라")
                
            }
        })
        
//        let url = "http://caratserver.pythonanywhere.com/user/auth"
//        let param : Parameters = [
//            email : "email",
//            password : "password"
//        ]
//
//        let call = AF.request(url, method : .post, parameters: param, encoding: JSONEncoding.default)//의뢰
//
//        call.responseJSON{//응답
//            res in
//
//            switch res.response?.statusCode {
//            case 200 :
//                print("로그인 성공")
//            default :
//                print("로그인에 실패했습니다.\(res.result)")
//                print(res.response?.statusCode)
//            }
//
            
            
            
        }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

