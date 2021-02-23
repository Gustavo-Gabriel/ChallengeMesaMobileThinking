//
//  NewsService.swift
//  ChallengeMesaMobileThinking
//
//  Created by Gustavo Anjos on 23/02/21.
//

import Foundation

class NewsService {
    
    func getNews(endPoint: API, token: String, completion: @escaping (Result<[News], NetworkError>) -> Void) {
        guard let url = URL(string: endPoint.path) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = endPoint.httpMethod
        request.httpBody = endPoint.httpBody
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(.urlError))
                return
            }
            
            let result = try? JSONDecoder().decode(NewsList.self, from: data)
            if let result = result {
                DispatchQueue.main.async {
                    completion(.success(result.data))
                }
            } else {
                completion(.failure(.decondingError))
            }
            
        }.resume()
    }
    
}
