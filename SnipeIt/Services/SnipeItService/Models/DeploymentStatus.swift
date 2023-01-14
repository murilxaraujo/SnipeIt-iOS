//
//  DeploymentStatus.swift
//  SnipeIt
//
//  Created by Murilo Araujo on 14/01/23.
//

import Foundation

struct DeploymentStatus: Codable {
    let id: Int
    let name: String
    let type: String
    let meta: String
    
    private enum CodingKeys: String, CodingKey {
        case id, name
        case type = "status_type"
        case meta = "status_meta"
    }
}
