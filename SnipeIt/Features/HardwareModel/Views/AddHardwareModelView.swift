//
//  AddHardwareModelView.swift
//  SnipeIt
//
//  Created by Murilo Araujo on 29/01/23.
//

import SwiftUI

struct AddHardwareModelView: View {
    @StateObject var viewModel = AddHardwareModelViewModel()
    
    var body: some View {
        Form {
            TextField("name", text: $viewModel.name)
            TextField("Model number", text: $viewModel.modelNumber)
            Button {
                viewModel.didTapSelectManufacturer()
            } label: {
                if let selectedManufacturer = viewModel.selectedManufacturer {
                    HStack {
                        Text("Manufacturer")
                        Spacer()
                        Text(selectedManufacturer.name)
                    }
                } else {
                    Text("Select hardware manufacturer")
                }
            }
            Button {
                viewModel.didTapSelectCategory()
            } label: {
                if let selectedCategory = viewModel.selectedCategory {
                    HStack {
                        Text("Category")
                        Spacer()
                        Text(selectedCategory.name)
                    }
                } else {
                    Text("Select hardware category")
                }
            }
        }.navigationTitle("New model")
            .sheet(isPresented: $viewModel.isPresentingSelectManufacturer) {
                NavigationStack {
                    ManufacturersView(selectedManufacturer: $viewModel.selectedManufacturer)
                }
            }.sheet(isPresented: $viewModel.isPresentingSelectCategory) {
                NavigationStack {
                    CategoriesView(selectedCategory: $viewModel.selectedCategory)
                }
            }
    }
}
