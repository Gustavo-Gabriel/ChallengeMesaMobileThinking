//
//  NewsService.swift
//  ChallengeMesaMobileThinking
//
//  Created by Gustavo Anjos on 23/02/21.
//

import Foundation

class NewsService {
    var session: URLSession!
    
    init() {
        self.session = URLSession.shared
    }
    
    func getNews(token: String, completion: @escaping (Result<[News], NetworkError>) -> Void){
        
    }
}
