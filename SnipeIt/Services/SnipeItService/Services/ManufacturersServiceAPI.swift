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
}
