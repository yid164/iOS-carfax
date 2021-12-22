//
//  VehiclesProvider.swift
//  iOS-carfax
//
//  Created by Yinsheng Dong on 2021-12-21.
//

import Foundation

class VehcilesProvider: ObservableObject {
    @Published var vehicleList: [VehicleDetail] = []
    @Published var isLoading: Bool = false
    @Published var error: Error?
    
    func loadingData() {
        isLoading = true
        api.loadJson { [weak self] result in
            guard let self = self else { return }
            switch result {
            case let .success(data):
                self.vehicleList = self.parseData(jsonData: data)
            case let .failure(error):
                self.error = error
            }
            self.isLoading = false
        }
    }
    
    private let api: Api = Api()
    
    private func parseData(jsonData: Data) -> [VehicleDetail] {
        do {
            let decodedData = try JSONDecoder().decode(DataParse.self, from: jsonData)
            return decodedData.listings
        } catch {
            print("Parse error")
        }
        return []
    }
    
    struct DataParse: Codable {
        let listings: [VehicleDetail]
    }
}
