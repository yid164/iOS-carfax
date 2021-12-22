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
            NavigationLink(destination: EmptyView()) {
                VStack(alignment: .leading) {
                    VehiclePhotoView(photo: vehicleDetail.images.firstPhoto.largeImage)
                    HStack(spacing: 6) {
                        Text("\(String(vehicleDetail.year))")
                            .bold()
                            .foregroundColor(Color.primary)
                        Text("\(vehicleDetail.make)")
                            .bold()
                            .foregroundColor(Color.primary)
                        Text("\(vehicleDetail.model)")
                            .bold()
                            .foregroundColor(Color.primary)
                        Text("\(vehicleDetail.trim)")
                            .bold()
                            .foregroundColor(Color.primary)
                    }
                    HStack(spacing: 7) {
                        Text("\(NSNumber(value: vehicleDetail.currentPrice), formatter: currencyFormatter)")
                            .bold()
                            .foregroundColor(Color.primary)
                        divider
                            .foregroundColor(Color.primary)
                        Text("\(vehicleDetail.mileage) Mi")
                            .foregroundColor(Color.primary)
                        divider
                            .foregroundColor(Color.primary)
                        Text("\(vehicleDetail.dealer.city), \(vehicleDetail.dealer.state)")
                            .foregroundColor(Color.primary)
                    }
                }
                .padding()
            }


            Button(action: { telephone(number: vehicleDetail.dealer.phone.toTelephoneNumber) }) {
                Text("\(vehicleDetail.dealer.phone.toPhoneNumber)")
            }
            
            Divider()
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

