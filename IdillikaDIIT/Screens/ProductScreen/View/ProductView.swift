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
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate   = self
        collectionView.dataSource = self
        presenter = ProductPresenterExp(view: self)
        presenter?.sendDataProduct()
        
        //MARK: - Back button custom
        let imgBackArrow = UIImage(named: "arrow")

        navigationController?.navigationBar.backIndicatorImage = imgBackArrow
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = imgBackArrow

        navigationItem.leftItemsSupplementBackButton = true
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        
    }
    
    @IBAction func shopCart(_ sender: Any) {
        guard let  vc = UIStoryboard(name: "ShopCart", bundle: nil).instantiateViewController(identifier: "ShopCartID") as? ShopCart else { return }
        self.navigationController?.pushViewController(vc, animated: true)
    }
}


extension ProductView: UICollectionViewDelegate , UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.model?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? ProductCell,
              let productModel = presenter?.model?[indexPath.item] else {return UICollectionViewCell() }
        cell.setUpCell(with: productModel)
        return cell
    }
    
    //Size on cell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        
        let cellWidth = ((collectionView.frame.width / 2) - (flowLayout.sectionInset.left + flowLayout.sectionInset.right) - flowLayout.minimumInteritemSpacing)
        
        return CGSize(width: cellWidth, height: cellWidth * 1.8)
    }
}

extension ProductView: ViewProduct {
    
    func showProduct() {
        
        self.activityIndicator.startAnimating()
        self.activityIndicator.isHidden = true
       
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
}
