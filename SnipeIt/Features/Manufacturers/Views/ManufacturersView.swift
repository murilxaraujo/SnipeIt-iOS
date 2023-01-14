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
            Text(manufacturer.name ?? "")
        }.onAppear {
            viewModel.fetch()
        }
    }
}

struct ManufacturersView_Previews: PreviewProvider {
    static var previews: some View {
        ManufacturersView()
    }
}
