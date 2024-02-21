//
//  LaunchService.swift
//  SapceX_Cansu
//
//  Created by Cansu Kahraman on 1.02.2024.
//

import Foundation
import Alamofire

final class LaunchService {
    func getLaunch(kind: Kind, completion: @escaping(Result<[LaunchModel], ServiceError>) -> ()) {
        var endpoint: String
        
        switch kind {
        case .upcoming:
            endpoint = Endpoint.upcoming
        case .past: 
            endpoint = Endpoint.past
        }
        
        AF.request(endpoint).response { response in
            guard let data = response.data else {
                completion(.failure(.badResponse))
                return
            }
            guard let model = try?JSONDecoder().decode([LaunchModel].self, from: data) else {
                completion(.failure(.badRequest))
                return
            }
            completion(.success(model))
        }
        
    }
}
