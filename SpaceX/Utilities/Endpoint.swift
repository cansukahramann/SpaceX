//
//  Endpoint.swift
//  SapceX_Cansu
//
//  Created by Cansu Kahraman on 2.02.2024.
//

import Foundation

struct Endpoint {
    static let baseURL = "https://api.spacexdata.com/v4"
    static let upcoming = "\(baseURL)/launches/upcoming"
    static let past = "\(baseURL)/launches/past"
    
    static func launchDetail(id: String) -> String {
        "\(baseURL)/launches/\(id)"
    }
}


