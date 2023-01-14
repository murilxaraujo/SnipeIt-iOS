//
//  SnipeItAPIConfig.swift
//  SnipeIt
//
//  Created by Murilo Araujo on 13/01/23.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
}

enum APIErrors: Error {
    case invalidURL
    case urlNotSet
    case tokenNotSet
    case couldNotDecode
    case serverError
}

struct SnipeItAPIConfig {
    let baseURL: String
    let token: String
    
    func executeGetting<T: Codable>(forPath path: String, usingMethod method: HTTPMethod = .get, andBody body: Codable? = nil) async throws -> T {
        guard let urlPath = URL(string: "\(baseURL)\(path)") else { throw APIErrors.invalidURL }
        
        var request = URLRequest(url: urlPath)
        request.httpMethod = method.rawValue
        if let body = body {
            request.httpBody = try? JSONEncoder().encode(body)
        }
        
        request.setValue(
            "Bearer \(token)",
            forHTTPHeaderField: "Authentication"
        )
        request.setValue(
            "application/json;charset=utf-8",
            forHTTPHeaderField: "Content-Type"
        )
        
        let (data, response) = try await URLSession.shared.data(for: request)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw APIErrors.serverError }
        guard let result = try? JSONDecoder().decode(T.self, from: data) else { throw APIErrors.couldNotDecode }
        return result
    }
}
