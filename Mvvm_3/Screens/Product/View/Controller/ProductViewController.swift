//
//  ProductViewController.swift
//  Mvvm_3
//
//  Created by Adarsh Singh on 07/09/23.
//

import UIKit
import Foundation
class ProductViewController: UIViewController {
    
    private var viewModel = ProductViewModel()
    
    @IBOutlet weak var productTableView:UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configuaration()
    }

    @IBAction func addProductBtn(_ sender: UIBarButtonItem) {
        let product  = AddProduct(title: "iPhone")
        viewModel.addProducts(parameter: product)
    }
    
}

extension ProductViewController{
    
    func configuaration(){
        
        productTableView.register(UINib(nibName: "ProductCell", bundle: nil), forCellReuseIdentifier: "ProductCell") 
        initViewModel()
        observeEvent()
    }
    
    func initViewModel(){
        
        viewModel.fetchProducts()
    }
    
    func observeEvent(){
        
        viewModel.eventHandler = { [weak self] event in
            
            guard let self else {return}
            
            switch event{
                
            case .loading:break
            case .stopLoading: break
            case.dataLoaded:
              
                DispatchQueue.main.async {
                    self.productTableView.reloadData()
                }
                
            case .error(let error):
                print(error)
            case .newProductAdded(let newProduct):
                print(newProduct)
            }
        }
    }
}
extension ProductViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath) as? ProductCell else{
            return UITableViewCell()
        }
        let product = viewModel.products[indexPath.row]
        cell.product = product
        
        return cell
    }
}


