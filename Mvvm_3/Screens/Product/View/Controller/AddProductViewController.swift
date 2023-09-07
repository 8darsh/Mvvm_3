//
//  AddProductViewController.swift
//  Mvvm_3
//
//  Created by Adarsh Singh on 08/09/23.
//

import UIKit



//struct ProductResponse: Codable{
//
//    let id: Int
//    let title: String
//}
//class AddProductViewController: UIViewController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Do any additional setup after loading the view.
//        addProduct()
//    }
//
//    func addProduct(){
//        guard let url = URL(string: "https://dummyjson.com/products/add") else {return}
//
//        let parameter = AddProduct(title: "BMW Car")
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//
//        //Model to data convert
//        request.httpBody = try? JSONEncoder().encode(parameter)
//
//        request.allHTTPHeaderFields = [
//
//            "Content-Type": "application/json"
//        ]
//        URLSession.shared.dataTask(with: request) { data, response, error in
//
//            guard let data else {return}
//
//            do{
//
//                // data to model
//                let productResponse = try JSONDecoder().decode(AddProduct.self, from: data)
//                print(productResponse)
//            }catch{
//                print(error)
//            }
//
//        }.resume()
//    }
//
//}
