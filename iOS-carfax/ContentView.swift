//
//  ContentView.swift
//  iOS-carfax
//
//  Created by Yinsheng Dong on 2021-12-21.
//

import SwiftUI

struct ContentView: View {
    @State var list: [VehicleDetail] = []
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(list, id: \.self) { item in
                    ListTileView(vehicleDetail: item)
                }
            }
        }
        .onAppear() {
            Api().loadJson { result in
                switch result {
                case let .success(data): self.list = Api().parseData(jsonData: data)
                default: self.list = []
                }
            }
        }

    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
