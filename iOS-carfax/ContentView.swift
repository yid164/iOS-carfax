//
//  ContentView.swift
//  iOS-carfax
//
//  Created by Yinsheng Dong on 2021-12-21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var provider = VehcilesProvider()
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(provider.vehicleList, id: \.self) { item in
                    ListTileView(vehicle: item)
                }
            }
            .overlay(
                ZStack {
                    if provider.isLoading {
                        ActivityIndicator(isAnimating: .constant(true), style: UIActivityIndicatorView.Style.medium)
                    }
                }
            )
            .navigationTitle(Text("Used Car"))
        }
        .onAppear() {
            provider.loadingData()
        }

    }
}
