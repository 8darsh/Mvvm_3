//
//  ApiManager.swift
//  Mvvm_3
//
//  Created by Adarsh Singh on 07/09/23.
//

import Foundation

enum DataError:Error{
    
    case invalidResponse
    case invalidUrl
    case invalidData
    case network(Error?)
}

typealias Handler<T> = (Result<T, DataError>)->Void
class ApiManager{
    
    static let shared = ApiManager()
    
    init(){}
    
    func request<T: Decodable>(
        
        modelType: T.Type,
        type: EndPointType,
        completion: @escaping Handler<T>
        
    ){
        guard let url = type.url else{
            completion(.failure(.invalidUrl))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data, error == nil else{
                completion(.failure(.invalidData))
                return
            }
            
            guard let response = response as? HTTPURLResponse,
                  200...299 ~= response.statusCode else{
                
                completion(.failure(.invalidResponse))
                return
            }
            
            do{
                
                let product = try JSONDecoder().decode(modelType, from: data)
                completion(.success(product))
                
            }catch{
                completion(.failure(.network(error)))
            }
            
        }.resume()
    }
    
//    func fetchProducts(completion: @escaping Handler){
//
//        guard let url = URL(string: Constant.Api.api) else{
//            completion(.failure(.invalidUrl))
//            return
//        }
//
//        URLSession.shared.dataTask(with: url) { data, response, error in
//
//            guard let data, error == nil else{
//                completion(.failure(.invalidData))
//                return
//            }
//
//            guard let response = response as? HTTPURLResponse,
//                  200...299 ~= response.statusCode else{
//
//                completion(.failure(.invalidResponse))
//                return
//            }
//
//            do{
//
//                 let product = try JSONDecoder().decode([ProductModel].self, from: data)
//                completion(.success(product))
//
//            }catch{
//                completion(.failure(.network(error)))
//            }
//
//        }.resume()
//
//
//    }
}
