//
//  DetailService.swift
//  SapceX_Cansu
//
//  Created by Cansu Kahraman on 13.02.2024.
//

import Foundation
import Alamofire

final class DetailService {
    func getDetail(id: String, completion: @escaping(Result<LaunchModel,ServiceError>) -> ()) {
        AF.request(Endpoint.launchDetail(id: id)).response { response in
            guard let data = response.data else {
                completion(.failure(.badResponse))
                return
            }
            guard let model = try? JSONDecoder().decode(LaunchModel.self, from: data) else {
                completion(.failure(.badRequest))
                return
            }
            completion(.success(model))
        }
    }
}
