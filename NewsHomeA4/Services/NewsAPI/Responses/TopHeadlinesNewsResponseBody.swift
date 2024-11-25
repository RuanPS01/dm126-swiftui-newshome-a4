//
//  NewsResponseBody.swift
//  NewsHomeA4
//
//  Created by Ruan Patrick de Souza on 24/11/24.
//

import Foundation

struct NewsResponse: Decodable {
    let status: String
    let totalResults: Int
    let articles: [Article]
    
    // Para tratar erros da API
    let code: String?
    let message: String?
}

struct Article: Decodable {
    let source: Source
    let author: String?
    let title: String
    let description: String?
    let url: String
    let urlToImage: String?
    let publishedAt: String
    let content: String?
}

struct Source: Decodable {
    let id: String?
    let name: String
}
