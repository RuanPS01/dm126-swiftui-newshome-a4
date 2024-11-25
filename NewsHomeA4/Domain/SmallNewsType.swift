//
//  GoalType.swift
//  NewsHomeA3
//
//  Created by Ruan Patrick de Souza on 24/11/24.
//

import Foundation

struct SmallNewsType: Identifiable{
    let id: String
    let image: String
    let title: String
    let description: String
    
    
    init(from article: Article) {
        self.id = UUID().uuidString
        self.image = "newspaper.fill"
        self.title = article.title
        self.description = article.description ?? "(Without description)"
    }
        
    init(title: String, description: String) {
        self.id = UUID().uuidString
        self.image = "newspaper.fill"
        self.title = title
        self.description = description
    }
}
