//
//  VehicleDetail.swift
//  iOS-carfax
//
//  Created by Yinsheng Dong on 2021-12-21.
//

import Foundation
import UIKit
import SwiftUI

struct Vehicle: Codable, Hashable {
    let id: String
    let images: VehicleImage
    let make: String
    let model: String
    let trim: String
    let year: Int
    let mileage: Int
    let dealer: Dealership
    let currentPrice: Double
    let listPrice: Double
    let accidentHistory: AccidentHistory
    
    static func == (lhs: Vehicle, rhs: Vehicle) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

}

struct VehicleImage: Codable {
    let baseUrl: String
    let firstPhoto: VehicleImagePhotos
}

struct VehicleImagePhotos: Codable {
    let large: String
    let medium: String
    let small: String
}

extension VehicleImagePhotos {
    var largeImage: Image? {
        if let data = try? Data(contentsOf: URL(string: large)!) { return Image(uiImage: UIImage(data: data)!)} else { return nil }
    }
    
    var mediumImage: Image? {
        if let data = try? Data(contentsOf: URL(string: medium)!) { return Image(uiImage: UIImage(data: data)!)} else { return nil }
    }
    
    var smallImage: Image? {
        if let data = try? Data(contentsOf: URL(string: small)!) { return Image(uiImage: UIImage(data: data)!)} else { return nil }
    }
}

struct Dealership: Codable {
    let name: String
    let phone: String
    let address: String
    let city: String
    let state: String
}

struct AccidentHistory: Codable {
    let accidentSummary: [String]
    let icon: String
    let iconUrl: String
    let text: String
}

extension AccidentHistory {
    var iconImage: Image? {
        if let data = try? Data(contentsOf: URL(string: iconUrl)!) { return Image(uiImage: UIImage(data: data)!)} else { return nil }
    }
}
