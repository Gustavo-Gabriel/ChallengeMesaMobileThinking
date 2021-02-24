//
//  ViewController.swift
//  ChallengeMesaMobileThinking
//
//  Created by Gustavo Anjos on 22/02/21.
//

import UIKit
import Combine

class SigninViewController: UIViewController {
    
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    var signinVM = SigninViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupDelegates()
        
    }
    
    func setupDelegates(){
        txtEmail.delegate = self
        txtPassword.delegate = self
    }
    
    @IBAction func login(_ sender: UIButton) {
        signinVM.email = txtEmail.text
        signinVM.password = txtPassword.text
        
    signinVM.signin()
        screenChangeLoginFeed()
    }
    
}

