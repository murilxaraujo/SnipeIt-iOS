//
//  ManufacturersView.swift
//  SnipeIt
//
//  Created by Murilo Araujo on 13/01/23.
//

import SwiftUI

struct ManufacturersView: View {
    @StateObject var viewModel = ManufacturersViewModel()

    var body: some View {
        List(viewModel.manufacturers, id: \.id) { manufacturer in
            HStack {
                Text(manufacturer.name)
                Spacer()
                if manufacturer.assetCount > 0 {
                    createBadge(withIconName: "barcode", andTotal: manufacturer.assetCount)
                }
                if manufacturer.accessoriesCount > 0 {
                    createBadge(withIconName: "keyboard.fill", andTotal: manufacturer.accessoriesCount)
                }
                if manufacturer.consumableCount > 0 {
                    createBadge(withIconName: "drop.fill", andTotal: manufacturer.consumableCount)
                }
                if manufacturer.licenseCount > 0 {
                    createBadge(withIconName: "key.fill", andTotal: manufacturer.licenseCount)
                }
            }
        }.onAppear {
            viewModel.fetch()
        }
    }
    
    @ViewBuilder
    func createBadge(withIconName icon: String, andTotal total: Int) -> some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.gray)
            Text("\(total)")
                .font(.caption)
        }
    }
}

struct ManufacturersView_Previews: PreviewProvider {
    static var previews: some View {
        ManufacturersView()
    }
}
