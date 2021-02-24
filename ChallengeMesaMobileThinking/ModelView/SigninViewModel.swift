//
//  SigninModelView.swift
//  ChallengeMesaMobileThinking
//
//  Created by Gustavo Anjos on 23/02/21.
//

import Foundation
import Combine


class SigninViewModel: AuthenticationProtocol {
    
    var email: String?
    var password: String?
    var token: String?
    
    private weak var delegate: StatusRequestDelegate?
    
    var formIsValid: Bool {
        return email?.isEmpty == false && password?.isEmpty == false
    }
    
    init(delegate: StatusRequestDelegate) {
        self.delegate = delegate
    }
    
    
    func signin() {
        
        guard let email = self.email else { return }
        guard let password = self.password else { return }
        
        let credentials = Credentials(email: email, password: password)
        
        AuthenticationService().postSignin(endPoint: .signin(credentials: credentials)) { (result) in
            
            switch result {
            
            case .success(let token):
                self.token = token
                self.delegate?.requestSucceeded()
                
            case .failure(let error):
                print(error.localizedDescription)
                self.delegate?.requestSucceeded()
                
            }
        }
    }
}

