//
//  ViewController.swift
//  ChallengeMesaMobileThinking
//
//  Created by Gustavo Anjos on 22/02/21.
//

import UIKit

class ViewController: UIViewController {
    
    var auth = AuthenticationService()
    var userDataLogin: [String: String] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func entrar(_ sender: Any) {
        auth.signin(email: "john@doe.com", password: "12345") { (headerAccess) in
            DispatchQueue.main.async {
                self.userDataLogin = headerAccess
                
                print(self.userDataLogin["token"] ?? "Credencias Incorretas" )
            }
        }
    }
    
}

