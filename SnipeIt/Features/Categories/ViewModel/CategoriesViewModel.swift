//
//  CategoriesViewModel.swift
//  SnipeIt
//
//  Created by Murilo Araujo on 29/01/23.
//

import Foundation

class CategoriesViewModel: ObservableObject {
    @Published var categories: [Category] = []
    @Published var newCategoryName = ""
    @Published var newCategoryType = CategoryType.asset
    @Published var isPresentingNewCategory = false
    
    @ResolveService var service: SnipeItService?
    
    @MainActor
    func getData() {
        Task {
            do {
                categories = try await service!.category.fetch().rows
            } catch {
                print("Could not get categories")
            }
        }
    }
    
    func didTapNewCategory() {
        isPresentingNewCategory = true
    }
    
    func addCategory() {
        guard !newCategoryName.isEmpty else { return }
        
        Task {
            do {
                try await service?.category.add(withName: newCategoryName, andType: newCategoryType)
                await getData()
            } catch {
                print("Could not add category")
            }
        }
    }
}
