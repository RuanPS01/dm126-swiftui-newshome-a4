//
//  ApiService.swift
//  NewsHomeA4
//
//  Created by Ruan Patrick de Souza on 24/11/24.
//

import Foundation
import Alamofire

struct APIService {
    let apiKey = "0745eead32aa4e0ea896bf9446aa9988"
    let baseUrl = "https://newsapi.org/v2"
    
    let session: Session
    
    init() {
        let interceptor = APIInterceptor(apiKey: apiKey, baseURL: baseUrl)
        self.session = Session(interceptor: interceptor)
    }
    
    func fetchTopHeadlines(
            parameters: TopHeadlinesParameters,
            completion: @escaping (Result<NewsResponse, Error>) -> Void
        ) {
            session.request(
                "/top-headlines",
                parameters: parameters.parameters
            )
            .validate()
            .responseDecodable(of: NewsResponse.self) { response in
                switch response.result {
                case .success(let newsResponse):
                    if newsResponse.status == "error" {
                        let error = NSError(
                            domain: "NewsAPI",
                            code: 400,
                            userInfo: [
                                NSLocalizedDescriptionKey: newsResponse.message ?? "Unknown error"
                            ]
                        )
                        completion(.failure(error))
                    } else {
                        completion(.success(newsResponse))
                    }
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
}
