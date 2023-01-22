//
//  NetworkService.swift
//  Yummie
//
//  Created by Dmitry Samusenko on 22.01.2023.
//

import Foundation

struct NetworkService {
    /// This function helps us to generate urlRequest
    /// - Parameters:
    ///   - route: the path to the resource in the backend
    ///   - method: type of request to be made
    ///   - parameters: whatever extra information you need to pass to the backend
    /// - Returns: URLRequesto
     func crateRequest(route: Route,
                              method: Method,
                              parameters: [String: Any]? = nil) -> URLRequest? {
        let stringURL = Route.baseUrl + route.description
        guard let url = stringURL.asUrl else { return nil }
        var urlRequest = URLRequest(url: url)
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.httpMethod = method.rawValue
        
        if let params = parameters {
            switch method {
            case .get:
                var urlComponents = URLComponents(string: stringURL)
                urlComponents?.queryItems = params.map { URLQueryItem(name: $0, value: "\($1)") }
                urlRequest.url = urlComponents?.url
            case .post, .delete, .patch:
                let bodyData = try? JSONSerialization.data(withJSONObject: params, options: [])
                urlRequest.httpBody = bodyData
            }
        }
        return urlRequest
    }
}
