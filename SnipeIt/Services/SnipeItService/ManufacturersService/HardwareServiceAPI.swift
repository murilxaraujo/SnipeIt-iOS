//
//  HardwareServiceAPI.swift
//  SnipeIt
//
//  Created by Murilo Araujo on 14/01/23.
//

import Foundation

class HardwareServiceAPI: HardwareService {
    
    let snipeItConfig: SnipeItAPIConfig
    
    init (config: SnipeItAPIConfig) {
        snipeItConfig = config
    }
    
    func fetch() async throws -> SnipeItCollection<Hardware> {
        return try await snipeItConfig.executeGetting(forPath: "api/v1/hardware")
    }
}
