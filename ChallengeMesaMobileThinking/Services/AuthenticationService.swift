//
//  AuthenticationService.swift
//  ChallengeMesaMobileThinking
//
//  Created by Gustavo Anjos on 22/02/21.
//

import Foundation

class AuthenticationService {
    
    var session: URLSession!
    public let url = URL(string: "https://mesa-news-api.herokuapp.com/v1/client/auth/signin")!
    
    init() {
        self.session = URLSession.shared
    }
    
    func signin(email: String, password: String, completion: @escaping ([String : String]) -> Void) {
        
        let userDict: [String : String] = ["email" : email, "password" : password]
        
        var request = URLRequest(url: self.url)
        request.setValue("application/json", forHTTPHeaderField: "Content-type")
        request.httpMethod = "POST"
        
        guard let json = try? JSONEncoder().encode(userDict) else { return }
        
        let uploadTask = URLSession.shared.uploadTask(with: request, from: json) {(data, response, error) in
            
            if let _ = error {
                completion([:])
            }
            
            if let httpResponse = response as? HTTPURLResponse {
                
                if (200...299).contains(httpResponse.statusCode) {
                
                    let result = try? JSONDecoder().decode(APIResponse.self, from: data!)
                    completion(["token" : result!.token])
                    
                } else {
                    completion([:])
                    return
                }
            }
        }
        uploadTask.resume()
    }
}
