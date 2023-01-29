//
//  Category.swift
//  SnipeIt
//
//  Created by Murilo Araujo on 29/01/23.
//

import Foundation

enum CategoryType: String, Codable, CaseIterable {
    case asset = "Asset"
    case accessory = "Accessory"
    case consumable = "Consumable"
    case component = "Component"
    case license = "License"
}

struct Category: Codable {
    let id: Int
    let name: String
    let type: CategoryType
    
    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case type = "category_type"
    }
}
