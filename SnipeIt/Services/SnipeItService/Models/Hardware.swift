//
//  Hardware.swift
//  SnipeIt
//
//  Created by Murilo Araujo on 14/01/23.
//

import Foundation

struct Hardware: Codable {
    let id: Int
    let name: String?
    let tag: String
    let serial: String?
    let model: Item
    let status: DeploymentStatus
    let category: Item
    let manufacturer: Item
    let image: String
    
    private enum CodingKeys: String, CodingKey {
        case id, name, serial, model, category, manufacturer, image
        case tag = "asset_tag"
        case status = "status_label"
    }
}
