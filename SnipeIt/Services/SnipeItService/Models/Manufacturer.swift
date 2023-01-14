//
//  Manufacturer.swift
//  SnipeIt
//
//  Created by Murilo Araujo on 13/01/23.
//

import Foundation

struct Manufacturer: Codable {
    let id: Int
    let name: String
    let url: String
    let image: String?
    let assetCount: Int
    let licenseCount: Int
    let consumableCount: Int
    let accessoriesCount: Int
    let createdAt: SnipeItDate
    let updatedAt: SnipeItDate
    let deletedAt: SnipeItDate?
    let availableActions: SnipeItActions
    
    private enum CodingKeys : String, CodingKey {
        case id, name, url, image
        case assetCount = "assets_count"
        case licenseCount = "licenses_count"
        case consumableCount = "consumables_count"
        case accessoriesCount = "accessories_count"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case deletedAt = "deleted_at"
        case availableActions = "available_actions"
    }
}
