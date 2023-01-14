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
    
    @KeychainService("snipeit-server-url") var keychainServerURL: String?
    @KeychainService("snipeit-token") var keychainAPIToken: String?
    
    func submit() {
        keychainServerURL = serverURL
        keychainAPIToken = serverToken
        
        DI.container.register(SnipeItService.self) { [self] _ in
            return SnipeItServiceAPI(config: SnipeItAPIConfig(baseURL: serverURL, token: serverToken))
        }
        
        MainViewModel.shared.state = .configured
    }
}
