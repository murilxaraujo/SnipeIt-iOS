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
    var statusLabel: StatusLabelService { get }
    var hardwareModel: HardwareModelService { get }
    var category: CategoryService { get }
}

protocol HardwareService {
    func fetch() async throws -> SnipeItCollection<Hardware>
}

protocol ManufacturersService {
    func fetch() async throws -> SnipeItCollection<Manufacturer>
    func add(withName name: String) async throws
}

protocol StatusLabelService {
    func fetch() async throws -> SnipeItCollection<StatusLabel>
}

protocol HardwareModelService {
    func fetch() async throws -> SnipeItCollection<HardwareModel>
}

protocol CategoryService {
    func fetch() async throws -> SnipeItCollection<Category>
}
