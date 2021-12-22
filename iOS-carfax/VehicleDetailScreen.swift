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
                
                VStack(alignment: .leading){
                    HStack {
                        Text("CARFAX REPORT")
                            .bold()
                            .font(.callout)
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
                
                

            }
        }
        .padding()
        .navigationTitle(Text("\(vehicle.make) \(vehicle.model)"))
    }
    
}
