//
//  SnipeItService.swift
//  SnipeIt
//
//  Created by Murilo Araujo on 13/01/23.
//

import Foundation

protocol SnipeItService {
    var manufacturers: ManufacturersService { get }
}

protocol AssetModelService {
    
}

protocol ManufacturersService {
    func fetch() async throws -> SnipeItCollection<Manufacturer>
}
