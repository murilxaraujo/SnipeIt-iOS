//
//  MainViewModel.swift
//  SnipeIt
//
//  Created by Murilo Araujo on 13/01/23.
//

import Foundation

class MainViewModel: ObservableObject {
    static let shared = MainViewModel()
    
    @Published var state: MainState = .idle
    @KeychainService("snipeit-server-url") var keychainServerURL: String?
    @KeychainService("snipeit-token") var keychainAPIToken: String?
    func fetch() {
        if let serverUrl = keychainServerURL,
           let apiToken = keychainAPIToken {
            DI.container.register(SnipeItService.self) { _ in
                SnipeItServiceAPI(config: SnipeItAPIConfig(baseURL: serverUrl, token: apiToken))
            }
            state = .configured
        } else {
            state = .pendingConfiguration
        }
    }
}
