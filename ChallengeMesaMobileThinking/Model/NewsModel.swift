//
//  NewsModel.swift
//  ChallengeMesaMobileThinking
//
//  Created by Gustavo Anjos on 23/02/21.
//

import Foundation

class NewsList: Codable {
    var data: [News]
    
    init(data: [News]) {
        self.data = data
    }
}

class News: Codable {
    var title: String
    var description: String
    var content: String
    var author: String
    var published_at: String
    var highlight: Bool
    var url: String
    var image_url: String
    
    init(title: String, description: String, content: String, author: String, published_at: String, highlight: Bool, url: String, image_url: String) {
        
        self.title = title
        self.description = description
        self.content = content
        self.author = author
        self.published_at = published_at
        self.highlight = highlight
        self.url = url
        self.image_url = image_url
    }
}
