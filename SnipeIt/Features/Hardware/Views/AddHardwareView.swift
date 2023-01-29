//
//  AddHardwareView.swift
//  SnipeIt
//
//  Created by Murilo Araujo on 28/01/23.
//

import SwiftUI

struct AddHardwareView: View {
    @StateObject var viewModel = AddHardwareViewModel()
    
    var body: some View {
        Form {
            TextField("name", text: $viewModel.name)
            TextField("Serial number", text: $viewModel.serial)
            if viewModel.status.count > 0 {
                Picker(selection: $viewModel.selectedStatus, label: Text("Status")) {
                    ForEach(viewModel.status, id: \.id) { status in
                        Text(status.name)
                    }
                }
            }
            Button {
                viewModel.didTapSelectModel()
            } label: {
                if let assetModel = viewModel.selectedModel {
                    HStack {
                        Text("Model")
                        Spacer()
                        Text(assetModel.name)
                    }
                } else {
                    Text("Select hardware model")
                }
            }
        }.onAppear {
            viewModel.getData()
        }.navigationTitle("Add hardware")
            .sheet(isPresented: $viewModel.isPresentingSelectModel) {
                NavigationStack {
                    HardwareModelView(selected: $viewModel.selectedModel)
                }
            }
    }
}

struct AddHardwareView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            AddHardwareView()
        }
    }
}
