//
//  CarolselNewsType.swift
//  NewsHomeA4
//
//  Created by Ruan Patrick de Souza on 24/11/24.
//

import Foundation

struct CarouselNewsType: Identifiable {
    let id: String
    let title: String
    let imageUrl: String
    
    init(from article: Article) {
        self.id = UUID().uuidString
        self.title = article.title
        self.imageUrl = article.urlToImage ?? ""
    }
    
    // Inicializador para preview
    init(title: String, imageUrl: String) {
        self.id = UUID().uuidString
        self.title = title
        self.imageUrl = imageUrl
    }
}
