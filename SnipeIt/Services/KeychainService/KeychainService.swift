//
//  KeychainService.swift
//  SnipeIt
//
//  Created by Murilo Araujo on 14/01/23.
//

import Foundation
import KeychainAccess
import SwiftUI

@propertyWrapper struct KeychainService {
    let key: String
    var storage = Keychain()
    
    var wrappedValue: String? {
        get  { value }
        nonmutating set {
            value = newValue
            do {
                guard let newValue = newValue else {
                    try? Keychain().remove(key)
                    return
                }
                try Keychain().set(newValue, key: key)
            } catch _ {
                try? Keychain().remove(key)
            }
        }
    }
    
    var projectedValue: Binding<String?> {
        Binding(get: { wrappedValue }, set: { wrappedValue = $0 })
    }
    
    @State private var value: String?
    
    init(wrappedValue: String? = nil, _ key: String) {
        
        self.key = key
        
        var initialValue = wrappedValue
        
        do {
            initialValue = try storage.getString(key)
        } catch let error {
            fatalError("\(error)")
        }
        
        self._value = State<String?>(initialValue: initialValue)
    }
}
