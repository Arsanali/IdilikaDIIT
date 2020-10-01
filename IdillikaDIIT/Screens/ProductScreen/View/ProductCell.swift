//
//  ProductCell.swift
//  IdillikaDIIT
//
//  Created by arsik on 23.09.2020.
//  Copyright © 2020 arsik. All rights reserved.
//

import UIKit
import SDWebImage

class ProductCell: UICollectionViewCell {
    
    let defaults = UserDefaults.standard
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var brand: UILabel!
    @IBOutlet weak var icon: UIImageView!
    
//MARK:- Сделать сохранение изменения картинки


    func swipeImage(){
        icon.isUserInteractionEnabled = true
        
        let tabGesture = UITapGestureRecognizer(target: self, action: #selector(gestureSwipeImage(sender:)))
        
        icon.addGestureRecognizer(tabGesture)
    }
    
    @objc func gestureSwipeImage(sender: UITapGestureRecognizer){
        if icon.image == UIImage(named: "Union") {
            icon.image = UIImage(named: "Union2")
        } else {
            icon.image = UIImage(named: "Union")
        }
    }
    
    func setUpCell(with model: ProductModel) {
        title.text = model.title
        price.text = String( model.price )
        brand.text = model.brand
        self.image.sd_setImage(with: URL(string: model.imageLink))
    }
}
