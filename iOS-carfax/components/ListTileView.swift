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

            Button(action: {}) {
                Text("\(vehicleDetail.dealer.phone.toPhoneNumber())")
            }
        }
    }
    
    var currencyFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.locale = .current
        formatter.numberStyle = .currency
        return formatter
    }
    
    var divider: some View {
        return Rectangle()
            .fill(.black)
            .frame(width: 1)
    }
}

extension String {
    public func toPhoneNumber() -> String {
        return self.replacingOccurrences(of: "(\\d{3})(\\d{3})(\\d+)", with: "($1) $2-$3", options: .regularExpression, range: nil)
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
        }
    }
}

