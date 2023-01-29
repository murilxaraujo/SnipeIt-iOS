//
//  AddHardwareModelViewModel.swift
//  SnipeIt
//
//  Created by Murilo Araujo on 29/01/23.
//

import Foundation

class AddHardwareModelViewModel: ObservableObject {
    @Published var name = ""
    @Published var modelNumber = ""
    @Published var selectedManufacturer: Manufacturer?
    @Published var selectedCategory: Category?
    
    @Published var isPresentingSelectManufacturer = false
    @Published var isPresentingSelectCategory = false
    
    @ResolveService var service: SnipeItService?
    
    func didTapSelectManufacturer() {
        isPresentingSelectManufacturer = true
    }
    
    func didTapSelectCategory() {
        isPresentingSelectCategory = true
    }
}
