//
//  MainScreen.swift
//  IdillikaDIIT
//
//  Created by arsik on 23.09.2020.
//  Copyright © 2020 arsik. All rights reserved.
//

import UIKit


class MainScreen: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func getProductBtn(_ sender: UIButton) {
        guard let vc = UIStoryboard(name: "ProductView", bundle: nil).instantiateViewController(identifier: "ProductVC") as? ProductView  else { return }
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
