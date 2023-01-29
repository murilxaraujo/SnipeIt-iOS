//
//  SnipeItServiceAPI.swift
//  SnipeIt
//
//  Created by Murilo Araujo on 13/01/23.
//

import Foundation

class SnipeItServiceAPI: SnipeItService {
    
    var manufacturers: ManufacturersService
    var hardware: HardwareService
    var statusLabel: StatusLabelService
    var hardwareModel: HardwareModelService
    var category: CategoryService
    
    init(config: SnipeItAPIConfig) {
        manufacturers = ManufacturersServiceAPI(config: config)
        hardware = HardwareServiceAPI(config: config)
        statusLabel = StatusLabelServiceAPI(config: config)
        hardwareModel = HardwareModelAPI(config: config)
        category = CategoryServiceAPI(config: config)
    }
}
