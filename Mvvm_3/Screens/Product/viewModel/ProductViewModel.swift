//
//  ProductViewModel.swift
//  Mvvm_3
//
//  Created by Adarsh Singh on 07/09/23.
//

import Foundation
import UIKit
final class ProductViewModel{
    
    var products:[ProductModel]=[]
    
    var eventHandler:((_ event: Event)->Void)?
    
    
    
    func fetchProducts(){
        self.eventHandler?(.loading)
        ApiManager.shared.request(modelType: [ProductModel].self,
                                  type: EndPointItems.products
        ){
            
            response in
            switch response{

            case .success(let product):
                self.eventHandler?(.stopLoading)
                self.products = product
                self.eventHandler?(.dataLoaded)

            case .failure(let error):
                self.eventHandler?(.error(error))
            }
            
            
        }
    }
    
//    func fetchData(){
//        ApiManager.shared.fetchProducts{ response in
//            self.eventHandler?(.loading)
//            switch response{
//
//            case .success(let product):
//                self.eventHandler?(.stopLoading)
//                self.products = product
//                self.eventHandler?(.dataLoaded)
//
//            case .failure(let error):
//                self.eventHandler?(.error(error))
//            }
//
//        }
//    }
//
    
}
extension ProductViewModel{
    
    enum Event{
        
        case loading
        case stopLoading
        case dataLoaded
        case error(Error?)
    }
}
