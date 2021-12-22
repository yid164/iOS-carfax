//
//  Extensions.swift
//  iOS-carfax
//
//  Created by Yinsheng Dong on 2021-12-21.
//

import Foundation
import SwiftUI

extension String {
    public var toPhoneNumber: String {
        self.replacingOccurrences(of: "(\\d{3})(\\d{3})(\\d+)", with: "($1) $2-$3", options: .regularExpression, range: nil)
    }
    
    public var toTelephoneNumber: String {
        self.replacingOccurrences(of: "(\\d{3})(\\d{3})(\\d+)", with: "$1-$2-$3", options: .regularExpression, range: nil)
    }
}

var currencyFormatter: NumberFormatter {
    let formatter = NumberFormatter()
    formatter.locale = .current
    formatter.numberStyle = .currency
    return formatter
}

func telephone(number: String) {
    let telephone = "tel://" + number
    print(telephone)
    guard let url = URL(string: telephone) else { print("nono"); return }
    UIApplication.shared.open(url)
}

extension View {
    var divider: some View {
        Rectangle()
            .frame(width: 1)
    }
}
