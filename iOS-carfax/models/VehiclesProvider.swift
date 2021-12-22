//
//  VehiclesProvider.swift
//  iOS-carfax
//
//  Created by Yinsheng Dong on 2021-12-21.
//

import Foundation
import Combine

class VehcilesProvider: ObservableObject {
    @Published var vehicleList: [VehicleDetail] = []
    @Published var isLoading: Bool = false
    @Published var error: Error?
        
    func loadingData() {
        isLoading = true
        api.loadDatas()
            .receive(on: RunLoop.main)
            .sink { [weak self] result in
                guard let self = self else { return }
                guard case let .failure(e) = result else { return }
                self.error = e
            } receiveValue: { [weak self] data in
                guard let self = self else { return }
                self.isLoading = false
                self.vehicleList = data.listings
                self.error = nil
            }
            .store(in: &cs)
    }
    
    private let api: Api = Api()
    private var cs: Set<AnyCancellable> = []
}
