//
//  API.swift
//  ChallengeMesaMobileThinking
//
//  Created by Gustavo Anjos on 23/02/21.
//

import Foundation

enum API {
    case getNews
    case getHighlights
    case signup(user: User)
    case signin(credentials: Credentials)
}

enum NetworkError: Error {
    case decondingError
    case domainError
    case urlError
}

extension API{
    
    var path: String {
        
        let urlBase = "https://mesa-news-api.herokuapp.com"
        
        switch self {
        
        case .getNews:
            return "\(urlBase)/v1/client/news"
            
        case .getHighlights:
            return "\(urlBase)/v1/client/news/highlights"
            
        case .signup:
            return "\(urlBase)/v1/client/auth/signup"
            
        case .signin:
            return "\(urlBase)/v1/client/auth/signin"
            
        }
        
    }
    
    var httpMethod: String {
        switch self {
        
        case .getNews:
            return "GET"
            
        case .getHighlights:
            return "GET"
            
        case .signup:
            return "POST"
            
        case .signin:
            return "POST"
            
        }
    }
    
    var httpBody: Data? {
        
        
        switch self {
        
        case .getNews:
            return nil
            
        case .getHighlights:
            return nil
            
        case .signin(let credentials):
            do{
                let jsonData = try JSONEncoder().encode(credentials)
                return jsonData
            } catch let jsonError {
                print("Catch: \(jsonError)")
                return nil
            }
            
        case .signup(let user):
            do{
                let jsonData = try JSONEncoder().encode(user)
                return jsonData
            } catch let jsonError {
                print("Catch: \(jsonError)")
                return nil
            }
            
        }
        
    }
    
}
