//
//  SnipeItCollection.swift
//  SnipeIt
//
//  Created by Murilo Araujo on 13/01/23.
//

import Foundation

struct SnipeItCollection<T: Codable>: Codable {
    let total: Int
    let rows: [T]
}
