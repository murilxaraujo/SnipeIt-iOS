//
//  ServerConfigViewModel.swift
//  SnipeIt
//
//  Created by Murilo Araujo on 13/01/23.
//

import Foundation

class ServerConfigViewModel: ObservableObject {
    @Published var serverURL: String = ""
    @Published var serverToken: String = ""
    
    func submit() {
        
    }
}
