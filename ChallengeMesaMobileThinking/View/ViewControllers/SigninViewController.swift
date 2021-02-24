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
    
    lazy var singinViewModel: SigninViewModel = {
        let viewModel = SigninViewModel(delegate: self)
        return viewModel
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupDelegates()
        
    }
    
    func setupDelegates(){
        txtEmail.delegate = self
        txtPassword.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueLoginFromFeed" {
            if let feedViewController = segue.destination as? FeedViewController {
                feedViewController.token = sender as? String
            }
        }
    }
    
    @IBAction func login(_ sender: UIButton) {
        singinViewModel.email = txtEmail.text
        singinViewModel.password = txtPassword.text
        
        singinViewModel.signin()
    }
    
}
