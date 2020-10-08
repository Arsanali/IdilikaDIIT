//
//  ShopCart.swift
//  IdillikaDIIT
//
//  Created by arsik on 26.09.2020.
//  Copyright © 2020 arsik. All rights reserved.
//

import UIKit

class ShopCart: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backBarButtonItem?.image = #imageLiteral(resourceName: "arrow")
    }
    
    @IBAction func backProduct(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}

