//
//  Api.swift
//  iOS-carfax
//
//  Created by Yinsheng Dong on 2021-12-21.
//

import Foundation
import Combine
import Network

class Api {
    private let apiUrl: String = "https://carfax-for-consumers.firebaseio.com/assignment.json"
    
    
    func loadJson(completion: @escaping (Result<Data, Error>) -> Void) {
        if let url = URL(string: apiUrl) {
            let urlSession = URLSession(configuration: .default).dataTask(with: url) { (data, response, error) in
                if let error = error {
                    completion(.failure(error))
                }
                
                if let data = data {
                    completion(.success(data))
                }
            }
            
            urlSession.resume()
        }
    }
    
    func parseData(jsonData: Data) -> [VehicleDetail] {
        do {
            let decodedData = try JSONDecoder().decode(DataParse.self,
                                                       from: jsonData)
            return decodedData.listings
        } catch {
            print("decode error")
        }
        return []
    }
    
    struct DataParse: Codable {
        let listings: [VehicleDetail]
    }
}




