//
//  ListTileView.swift
//  iOS-carfax
//
//  Created by Yinsheng Dong on 2021-12-21.
//

import SwiftUI

struct ListTileView: View {
    var vehicleDetail: VehicleDetail
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                VehiclePhotoView(photo: vehicleDetail.images.firstPhoto.largeImage)
                HStack(spacing: 3) {
                    Text("\(String(vehicleDetail.year))")
                        .bold()
                    Text("\(vehicleDetail.make)")
                        .bold()
                    Text("\(vehicleDetail.model)")
                        .bold()
                    Text("\(vehicleDetail.trim)")
                        .bold()
                }
                HStack(spacing: 7) {
                    Text("\(NSNumber(value: vehicleDetail.currentPrice), formatter: currencyFormatter)")
                        .bold()
                    divider
                    Text("\(vehicleDetail.mileage) Mi")
                    divider
                    Text("\(vehicleDetail.dealer.city), \(vehicleDetail.dealer.state)")
                }
            }
            .padding()

            Button(action: { telephone(number: vehicleDetail.dealer.phone.toTelephoneNumber) }) {
                Text("\(vehicleDetail.dealer.phone.toPhoneNumber)")
            }
        }
    }
}

struct VehiclePhotoView: View {
    var photo: Image?
    var body: some View {
        if let photo = photo {
            photo
                .resizable()
                .scaledToFit()
        } else {
            Image(systemName: "photo.fill")
                .resizable()
                .scaledToFit()
                .foregroundColor(.gray)
        }
    }
}

