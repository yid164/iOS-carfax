//
//  Api.swift
//  iOS-carfax
//
//  Created by Yinsheng Dong on 2021-12-21.
//

import Foundation
import Combine

class Api {
    
    private let apiUrl: String = "https://carfax-for-consumers.firebaseio.com/assignment.json"
    
    func loadDatas() -> AnyPublisher<DataParse, Error> {
        let url = URL(string: apiUrl)!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        return URLSession.shared.dataTaskPublisher(for: request)
            .tryMap { data, response in
                if data.isEmpty {
                    throw LoadingError()
                } else {
                    return data
                }
            }
            .decode(type: DataParse.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}

struct DataParse: Codable {
    let listings: [Vehicle]
}

struct LoadingError: Error { }
