//
//  UserModel.swift
//  ChallengeMesaMobileThinking
//
//  Created by Gustavo Anjos on 23/02/21.
//


import Foundation

class User: Codable {
    let name: String
    let email: String
    let password: String
    
    init(name: String, email: String, password: String) {
        self.name = name
        self.email = email
        self.password = password
    }
}
