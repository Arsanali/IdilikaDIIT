//
//  ProductView.swift
//  IdillikaDIIT
//
//  Created by arsik on 23.09.2020.
//  Copyright © 2020 arsik. All rights reserved.
//

import UIKit

class ProductView: UIViewController {
    
    var presenter: ProductPresenter?
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate   = self
        collectionView.dataSource = self
        presenter = ProductPresenterExp(view: self)
        presenter?.sendDataProduct()
    }
    
    @IBAction func shopCart(_ sender: Any) {
        guard let  vc = UIStoryboard(name: "ShopCart", bundle: nil).instantiateViewController(identifier: "ShopCartID") as? ShopCart else { return }
        self.navigationController?.pushViewController(vc, animated: true)
    }
}


extension ProductView: UICollectionViewDelegate , UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.model?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? ProductCell,
              let productModel = presenter?.model?[indexPath.item] else {return UICollectionViewCell() }
        cell.setUpCell(with: productModel)
        cell.swipeImage()
        return cell
    }
}

extension ProductView: ViewProduct {
    func showProduct() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
}
