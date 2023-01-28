//
//  HardwareModel.swift
//  SnipeIt
//
//  Created by Murilo Araujo on 28/01/23.
//

import Foundation

struct HardwareModel: Codable, Hashable {
    let id: Int
    let name: String
    let manufacturer: Item
    let category: Item
}
