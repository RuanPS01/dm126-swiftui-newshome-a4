//
//  NewsViewModel.swift
//  NewsHomeA4
//
//  Created by Ruan Patrick de Souza on 24/11/24.
//

import SwiftUI
import Alamofire

class NewsViewModel: ObservableObject {
    @Published var news: [SmallNewsType] = []
    @Published var isLoading = false
    @Published var error: String?
    
    private let apiService = APIService()
    
    func fetchNews() {
        isLoading = true
        
        let parameters = TopHeadlinesParameters(
            country: .us,
            category: .business,
            pageSize: 20
        )
        
        apiService.fetchTopHeadlines(parameters: parameters) { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                
                switch result {
                case .success(let response):
                    self?.news = response.articles.map { SmallNewsType(from: $0) }
                case .failure(let error):
                    self?.error = error.localizedDescription
                }
            }
        }
    }
}
