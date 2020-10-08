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
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var brand: UILabel!
    
    @IBOutlet weak var iconImage: UIButton!
    
    private var currentProduct: ProductModel? = nil
    
    //MARK: - Сделать сохранение изменения картинки
    
    @IBAction func swipeImage(_ sender: UIButton) {
        
        iconImage.isSelected = Favorites.shared.favoriteClick(id: currentProduct?.id ?? 0)
        
        if (iconImage.isSelected) {
            iconImage.setImage(#imageLiteral(resourceName: "Union2"), for: .selected)
        } else {
            iconImage.setImage(#imageLiteral(resourceName: "Union"), for: .normal)
        }
    }
    
    func setUpCell(with model: ProductModel) {
        
        currentProduct = model
        
        title.text = model.title
        price.text = " \(model.price) ₽"
        price.addCharacterSpacing(kernValue: 4.0)
        brand.text = model.brand
        
        //
        let imageWidth = Double(self.frame.width)
                let imageHeight = imageWidth * 1.26
        image.frame = CGRect(x: 0, y: 0, width: imageWidth, height: imageHeight)
        image.sd_setImage(with: URL(string: model.imageLink))
        
        iconImage.isSelected = Favorites.shared.checkForFavorites(id: model.id)
        
        if (iconImage.isSelected) {
            iconImage.setImage(#imageLiteral(resourceName: "Union2"), for: .selected)
        } else {
            iconImage.setImage(#imageLiteral(resourceName: "Union"), for: .normal)
        }
    }
}
