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
}
