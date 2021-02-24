//
//  SigninModelView.swift
//  ChallengeMesaMobileThinking
//
//  Created by Gustavo Anjos on 23/02/21.
//

import Foundation
import Combine

protocol AuthenticationProtocol {
    var formIsValid: Bool { get }
}

class SigninViewModel: AuthenticationProtocol {
    
    
    var email: String?
    var password: String?
    var token: String?
    
    var formIsValid: Bool {
        return email?.isEmpty == false && password?.isEmpty == false
    }    
    
    func signin() {
        
        guard let email = self.email else { return }
        guard let password = self.password else { return }

        let credentials = Credentials(email: email, password: password)
        
        AuthenticationService().postSignin(endPoint: .signin(credentials: credentials)) { (result) in
            switch result {
            case .success(let token):
                self.token = token
                print(self.token!)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

