//
//  CarouselNewsViewModel.swift
//  NewsHomeA4
//
//  Created by Ruan Patrick de Souza on 24/11/24.
//

import SwiftUI
import Alamofire

class CarouselViewModel: ObservableObject {
    @Published var news: [CarouselNewsType] = []
    @Published var isLoading = false
    @Published var error: String?
    
    private let apiService = APIService()
    
    func fetchNews() {
        isLoading = true
        
        let parameters = TopHeadlinesParameters(
            country: .us,
            category: .technology,
            pageSize: 5
        )
        
        apiService.fetchTopHeadlines(parameters: parameters) { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                
                switch result {
                case .success(let response):
                    // Filtra apenas artigos que têm imagem
                    self?.news = response.articles
                        .filter { $0.urlToImage != nil }
                        .map { CarouselNewsType(from: $0) }
                case .failure(let error):
                    self?.error = error.localizedDescription
                }
            }
        }
    }
}
