//
//  ManufacturersServiceAPI.swift
//  SnipeIt
//
//  Created by Murilo Araujo on 13/01/23.
//

import Foundation

class ManufacturersServiceAPI: ManufacturersService {

    let snipeItConfig: SnipeItAPIConfig
    
    init (config: SnipeItAPIConfig) {
        snipeItConfig = config
    }
    
    @MainActor
    func fetch() async throws -> SnipeItCollection<Manufacturer> {
        return try await snipeItConfig.executeGetting(forPath: "api/v1/manufacturers")
    }
    
    func add(withName name: String) async throws {
        let _: Empty = try await snipeItConfig.executeGetting(forPath: "api/v1/manufacturers", usingMethod: .post, andBody: AddRequest(name: name))
    }
    
    struct AddRequest: Codable {
        let name: String
    }
}
