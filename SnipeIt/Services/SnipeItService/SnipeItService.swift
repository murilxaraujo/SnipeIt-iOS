//
//  SnipeItService.swift
//  SnipeIt
//
//  Created by Murilo Araujo on 13/01/23.
//

import Foundation

protocol SnipeItService {
    var manufacturers: ManufacturersService { get }
    var hardware: HardwareService { get }
}

protocol HardwareService {
    func fetch() async throws -> SnipeItCollection<Hardware>
}

protocol ManufacturersService {
    func fetch() async throws -> SnipeItCollection<Manufacturer>
}
