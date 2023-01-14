//
//  SnipeItServiceAPI.swift
//  SnipeIt
//
//  Created by Murilo Araujo on 13/01/23.
//

import Foundation

class SnipeItServiceAPI: SnipeItService {
    
    var manufacturers: ManufacturersService
    
    init(config: SnipeItAPIConfig) {
        manufacturers = ManufacturersServiceAPI(config: config)
    }
}
