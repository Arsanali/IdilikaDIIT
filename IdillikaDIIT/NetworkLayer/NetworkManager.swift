//
//  NetworkManager.swift
//  IdillikaDIIT
//
//  Created by arsik on 23.09.2020.
//  Copyright © 2020 arsik. All rights reserved.
//

import Foundation
import Alamofire

protocol NetworkManager {
  func getData(completion: @escaping(Result<[ProductModel], Error>)->())
}

class NetworkManegerExp: NetworkManager {
        
  func getData(completion: @escaping (Result<[ProductModel], Error>) -> ()) {

    AF.request(API.baseUrl, method: .get).response {(responseData) in
        
        if let error = responseData.error {
            completion(.failure(error))
            return
        }
      
      guard let data = responseData.data else { return }
      
      do {
        let productData = try JSONDecoder().decode([ProductModel].self, from:data )
        
        completion(.success(productData))
        
        print(productData)
      } catch (let error) {
        
        completion(.failure(error))
        
        print("Данные не пришли \(error.localizedDescription)")
        
            }
        }
    }
}

  


