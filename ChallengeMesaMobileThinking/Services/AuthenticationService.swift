//
//  AuthenticationService.swift
//  ChallengeMesaMobileThinking
//
//  Created by Gustavo Anjos on 22/02/21.
//

import Foundation

class AuthenticationService {
    
    func postSignin(endPoint: API, completion: @escaping (Result<String, NetworkError>) -> Void) {
        
        guard let url = URL(string: endPoint.path) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = endPoint.httpMethod
        request.httpBody = endPoint.httpBody
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(.urlError))
                return
            }
            
            let result = try? JSONDecoder().decode(APIResponse.self, from: data)
            
            if let result = result {
                DispatchQueue.main.async {
                    completion(.success(result.token))
                }
            } else {
                completion(.failure(.decondingError))
            }
            
        }.resume()
        
    }
}
