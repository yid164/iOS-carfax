//
//  VehicleDetailScreen.swift
//  iOS-carfax
//
//  Created by Yinsheng Dong on 2021-12-21.
//

import SwiftUI

struct VehicleDetailScreen: View {
    var vehicle: Vehicle
    
    var body: some View {
        ScrollView {
            VehiclePhotoView(photo: vehicle.images.firstPhoto.largeImage)
            
            VStack(alignment: .leading) {
                HStack {
                    Text("\(String(vehicle.year))")
                        .bold()
                    Text("\(vehicle.make)")
                        .bold()
                    Text("\(vehicle.model)")
                        .bold()
                    Text("\(vehicle.trim)")
                        .bold()
                    divider
                    Text("\(NSNumber(value: vehicle.currentPrice), formatter: currencyFormatter)")
                        .bold()
                }
                
                Text("Mileage: \(String(vehicle.mileage))")
                    .font(.footnote)
                    .italic()
                
                VStack(alignment: .leading){
                    HStack {
                        Text("CARFAX REPORT")
                            .bold()
                            .font(.headline)
                        if vehicle.accidentHistory.iconImage != nil {
                            vehicle.accidentHistory.iconImage!
                                .resizable()
                                .scaledToFit()
                                .frame(width: 15, height: 15)
                        }
                        Spacer()
                    }
                    Text("\(vehicle.accidentHistory.text)")
                }
                
                Divider()
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("Basic Specifications")
                        .bold()
                        .font(.headline)
                    Spacer()
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Transmission: \(vehicle.transmission)")
                                .font(.callout)
                            Text("Body type: \(vehicle.bodytype)")
                                .font(.callout)
                            Text("Drive type: \(vehicle.drivetype)")
                                .font(.callout)
                            Text("Exterior color: \(vehicle.exteriorColor)")
                                .font(.callout)
                        }
                        Spacer()
                        VStack(alignment: .leading) {
                            Text("Fuel: \(vehicle.fuel)")
                                .font(.callout)
                            Text("Engine: \(vehicle.engine)")
                                .font(.callout)
                            Text("Certified: \(vehicle.certified ? "Yes" : "No")")
                                .font(.callout)
                            Text("Subtrim: \(vehicle.subTrim)")
                                .font(.callout)
                        }
                    }
                }
            }
        }
        .padding([.horizontal])
        .navigationTitle(Text("\(vehicle.make) \(vehicle.model)"))
    }
    
}
