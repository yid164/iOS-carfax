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
            VehiclePhotoView(photo: vehicleDetail.images.firstPhoto.largeImage)
            HStack {
                Text("\(vehicleDetail.year)")
                Text("\(vehicleDetail.make)")
                Text("\(vehicleDetail.model)")
                Text("\(vehicleDetail.trim)")
            }
            HStack {
                Text("\(NSNumber(value: vehicleDetail.currentPrice), formatter: currencyFormatter) | ")
                Text("\(vehicleDetail.mileage.kmFormatted) Mi | ")
                Text("\(vehicleDetail.dealer.city), \(vehicleDetail.dealer.state)")
            }
            
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
    
}

extension Int {
    var kmFormatted: String {
        if self >= 10000, self <= 999999 {
            return String(format: "%.1fK", locale: Locale.current,self/1000).replacingOccurrences(of: ".0", with: "")
        }

        if self > 999999 {
            return String(format: "%.1fM", locale: Locale.current,self/1000000).replacingOccurrences(of: ".0", with: "")
        }

        return String(format: "%.0f", locale: Locale.current,self)
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
        } else {
            Image(systemName: "photo.fill")
        }
    }
}

