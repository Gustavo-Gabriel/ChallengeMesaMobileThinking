//
//  ViewController+Extension.swift
//  ChallengeMesaMobileThinking
//
//  Created by Gustavo Anjos on 23/02/21.
//

import UIKit

extension SigninViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        let nextTag = textField.tag + 1
        
        if let nextResponder = textField.superview?.viewWithTag(nextTag){
            nextResponder.becomeFirstResponder()
        }else{
            textField.resignFirstResponder()
        }
        
        return true
    }
}

extension SigninViewController: StatusRequestDelegate {
    
    func requestSucceeded() {
        if let token = singinViewModel.token {
            performSegue(withIdentifier: "segueLoginFromFeed", sender: token)
        } else {
            DispatchQueue.main.async(execute: {
                self.showAlert(title: "Error", message: "Try again later")
             })
        }
    }
    
    func requestFailed() {
        showAlert(title: "Error", message: "Try again later")
    }
}


