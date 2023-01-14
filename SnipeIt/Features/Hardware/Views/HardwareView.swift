//
//  HardwareView.swift
//  SnipeIt
//
//  Created by Murilo Araujo on 14/01/23.
//

import SwiftUI

struct HardwareView: View {
    @StateObject var viewModel = HardwareViewModel()
    
    var body: some View {
        List(viewModel.hardwares, id: \.id) { hardware in
            HStack {
                VStack(alignment: .leading) {
                    Text(hardware.name?.removingPercentEncoding ?? "")
                    Text(hardware.manufacturer.name)
                        .font(.subheadline)
                    Spacer()
                    HStack {
                        Image(systemName: "barcode").foregroundColor(.gray)
                        Text(hardware.tag).font(.caption)
                    }
                }.padding(.top)
                    .padding(.bottom)
                Spacer()
                AsyncImage(url: URL(string: hardware.image.replacingOccurrences(of: "\\", with: "")))
                    .frame(width: 100, height: 100)
            }
        
        }
        .onAppear {
            viewModel.fetch()
        }
    }
}

struct HardwareView_Previews: PreviewProvider {
    
    static var previews: some View {
        return HardwareView()
    }
}
