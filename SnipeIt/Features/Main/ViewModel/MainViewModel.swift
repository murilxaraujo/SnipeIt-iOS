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
}
