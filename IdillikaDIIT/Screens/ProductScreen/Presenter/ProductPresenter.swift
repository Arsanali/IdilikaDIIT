//
//  ProductPresenter.swift
//  IdillikaDIIT
//
//  Created by arsik on 23.09.2020.
//  Copyright © 2020 arsik. All rights reserved.
//

import Foundation

protocol ViewProduct: class {
    func showProduct()
}

protocol ProductPresenter: class {
    func sendDataProduct()
    var model: [ProductModel]? { get set }
}

class ProductPresenterExp: ProductPresenter {
    let userDefaults = UserDefaults.standard
    
    weak var view: ViewProduct?
    var model: [ProductModel]?
    let networking: NetworkManager
    
    init(view: ViewProduct){
        self.view = view
        self.networking = NetworkManegerExp()
    }
    
    
    func sendDataProduct() {
        networking.getData { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let value):
                    self?.model = value
                    self?.view?.showProduct()
                    print(value)

                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}
