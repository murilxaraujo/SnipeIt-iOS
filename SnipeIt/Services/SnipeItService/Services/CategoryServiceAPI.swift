//
//  CategoryServiceAPI.swift
//  SnipeIt
//
//  Created by Murilo Araujo on 29/01/23.
//

import Foundation

class CategoryServiceAPI: CategoryService {

    
    let snipeItConfig: SnipeItAPIConfig
    
    init (config: SnipeItAPIConfig) {
        snipeItConfig = config
    }
    
    func fetch() async throws -> SnipeItCollection<Category> {
        return try await snipeItConfig.executeGetting(forPath: "api/v1/categories")
    }
    
    func add(withName name: String, andType type: CategoryType) async throws {
        let _: Empty = try await snipeItConfig.executeGetting(forPath: "api/v1/categories", usingMethod: .post, andBody: AddRequest(name: name, type: type))
    }
    
    struct AddRequest: Codable {
        let name: String
        let type: CategoryType
        
        private enum CodingKeys: String, CodingKey {
            case name
            case type = "category_type"
        }
    }
}
