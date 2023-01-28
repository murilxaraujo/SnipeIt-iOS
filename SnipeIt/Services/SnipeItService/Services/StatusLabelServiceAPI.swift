//
//  StatusLabelServiceAPI.swift
//  SnipeIt
//
//  Created by Murilo Araujo on 28/01/23.
//

import Foundation

class StatusLabelServiceAPI: StatusLabelService {
    let snipeItConfig: SnipeItAPIConfig
    
    init (config: SnipeItAPIConfig) {
        snipeItConfig = config
    }
    
    func fetch() async throws -> SnipeItCollection<StatusLabel> {
        return try await snipeItConfig.executeGetting(forPath: "api/v1/statuslabels")
    }
}
