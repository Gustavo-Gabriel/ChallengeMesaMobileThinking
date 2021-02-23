//
//  ViewController+Extension.swift
//  ChallengeMesaMobileThinking
//
//  Created by Gustavo Anjos on 23/02/21.
//

import UIKit

extension LoginViewModel: UITextFieldDelegate {
    
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

