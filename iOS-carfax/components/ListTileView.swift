//
//  ListTileView.swift
//  iOS-carfax
//
//  Created by Yinsheng Dong on 2021-12-21.
//

import SwiftUI

struct ListTileView: View {
    var vehicle: Vehicle
    
    var body: some View {
        VStack {
            NavigationLink(destination: VehicleDetailScreen(vehicle: vehicle)) {
                VStack(alignment: .leading) {
                    VehiclePhotoView(photo: vehicle.images.firstPhoto.largeImage)
                    HStack(spacing: 6) {
                        Text("\(String(vehicle.year))")
                            .bold()
                            .foregroundColor(Color.primary)
                        Text("\(vehicle.make)")
                            .bold()
                            .foregroundColor(Color.primary)
                        Text("\(vehicle.model)")
                            .bold()
                            .foregroundColor(Color.primary)
                        Text("\(vehicle.trim)")
                            .bold()
                            .foregroundColor(Color.primary)
                    }
                    HStack(spacing: 7) {
                        Text("\(NSNumber(value: vehicle.currentPrice), formatter: currencyFormatter)")
                            .bold()
                            .foregroundColor(Color.primary)
                        divider
                            .foregroundColor(Color.primary)
                        Text("\(vehicle.mileage) Mi")
                            .foregroundColor(Color.primary)
                        divider
                            .foregroundColor(Color.primary)
                        Text("\(vehicle.dealer.city), \(vehicle.dealer.state)")
                            .foregroundColor(Color.primary)
                    }
                }
                .padding()
            }


            Button(action: { telephone(number: vehicle.dealer.phone.toTelephoneNumber) }) {
                Text("\(vehicle.dealer.phone.toPhoneNumber)")
            }
            
            Divider()
        }
    }
}

