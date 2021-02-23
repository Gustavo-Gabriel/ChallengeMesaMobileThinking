//
//  ViewController.swift
//  ChallengeMesaMobileThinking
//
//  Created by Gustavo Anjos on 22/02/21.
//

import UIKit

class LoginViewModel: UIViewController {
    
    var auth = AuthenticationService()
    var userDataLogin: [String: String] = [:]
    
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        txtEmail.delegate = self
        txtPassword.delegate = self
    }
    
    
    @IBAction func loginUser(_ sender: Any) {
        auth.signin(email: "john@doe.com", password: "123456") { (headerAccess) in
            
            DispatchQueue.main.async {
                self.userDataLogin = headerAccess
                
                if self.userDataLogin == [:]{
                    print("Credencias Erradas")
                }else {
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let secondVC = storyboard.instantiateViewController(identifier: "FeedView")
                    secondVC.modalPresentationStyle = .fullScreen                    
                    self.present(secondVC, animated: true, completion: nil)
                }
            }
            
        }
    }
    //    @IBAction func entrar(_ sender: Any) {
//        auth.signin(email: "john@doe.com", password: "123456") { (headerAccess) in
//            DispatchQueue.main.async {
//                self.userDataLogin = headerAccess
//
//                print(self.userDataLogin["token"] ?? "Credencias Incorretas" )
//            }
//        }
//    }
    
}

