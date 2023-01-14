//
//  ResolveService.swift
//  SnipeIt
//
//  Created by Murilo Araujo on 14/01/23.
//

import Foundation
import Swinject

class DI {
    static let container = Container()
}

@propertyWrapper struct ResolveService<T> {
    var wrappedValue: T? {
        get {
            DI.container.resolve(T.self)
        }
    }
}
