//
//  VehicleDetail.swift
//  iOS-carfax
//
//  Created by Yinsheng Dong on 2021-12-21.
//

import Foundation

struct VehicleDetail: Codable {
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

struct Dealership: Codable {
    let name: String
    let phone: String
    let address: String
    let city: String
    let state: String
}
