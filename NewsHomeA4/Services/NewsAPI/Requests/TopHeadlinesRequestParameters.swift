//
//  TopHeadlinesParameters.swift
//  NewsHomeA4
//
//  Created by Ruan Patrick de Souza on 24/11/24.
//

struct TopHeadlinesParameters {
    var country: NewsCountry?
    var category: NewsCategory?
    var sources: String? // IDs das fontes, separados por vírgula
    var q: String?       // Keywords
    var pageSize: Int?   // Máx 100
    var page: Int?
    
    var parameters: [String: Any] {
        var params: [String: Any] = [:]
        
        if let country = country {
            params["country"] = country.rawValue
        }
        if let category = category {
            params["category"] = category.rawValue
        }
        if let sources = sources {
            params["sources"] = sources
        }
        if let q = q {
            params["q"] = q
        }
        if let pageSize = pageSize {
            params["pageSize"] = min(pageSize, 100)
        }
        if let page = page {
            params["page"] = max(1, page)
        }
        
        return params
    }
}
