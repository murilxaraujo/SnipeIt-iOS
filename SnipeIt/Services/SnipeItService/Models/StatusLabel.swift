//
//  StatusLabel.swift
//  SnipeIt
//
//  Created by Murilo Araujo on 28/01/23.
//

import Foundation

enum StatusLabelType: String, Codable {
    case pending = "pending"
    case deployable = "deployable"
    case archived = "archived"
}

struct StatusLabel: Codable, Identifiable, Hashable {
    let id: Int
    let name: String
    let type: StatusLabelType
}
