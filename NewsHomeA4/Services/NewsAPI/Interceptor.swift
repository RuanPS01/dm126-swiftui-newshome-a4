//
//  Interceptor.swift
//  NewsHomeA4
//
//  Created by Ruan Patrick de Souza on 24/11/24.
//
import Foundation
import Alamofire

class APIInterceptor: RequestInterceptor {
    private let apiKey: String
    private let baseURL: String
    
    init(apiKey: String, baseURL: String) {
        self.apiKey = apiKey
        self.baseURL = baseURL.last == "/" ? String(baseURL.dropLast()) : baseURL
    }
    
    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        var request = urlRequest
        
        guard let url = urlRequest.url else {
            completion(.success(request))
            return
        }
        
        let fullURL = "\(baseURL)\(url.path)\(url.query != nil ? "?\(url.query!)" : "")"
        guard let finalURL = URL(string: fullURL) else {
            completion(.success(request))
            return
        }
        
        var components = URLComponents(url: finalURL, resolvingAgainstBaseURL: false)!
        let existingItems = components.queryItems ?? []
        components.queryItems = existingItems + [URLQueryItem(name: "apiKey", value: apiKey)]
        
        request.url = components.url
        completion(.success(request))
    }
}
