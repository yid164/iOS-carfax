//
//  VehiclePhotoView.swift
//  iOS-carfax
//
//  Created by Yinsheng Dong on 2021-12-21.
//

import SwiftUI

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

