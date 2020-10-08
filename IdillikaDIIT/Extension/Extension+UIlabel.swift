//
//  Extension+UIlabel.swift
//  IdillikaDIIT
//
//  Created by arsik on 08.10.2020.
//  Copyright © 2020 arsik. All rights reserved.
//

import UIKit

extension UILabel {
  func addCharacterSpacing(kernValue: Double = 1.0) {
    if let labelText = text, labelText.count > 0 {
      let attributedString = NSMutableAttributedString(string: labelText)
        attributedString.addAttribute(NSAttributedString.Key.kern, value: kernValue, range: NSRange(location: 0, length: attributedString.length  - 5))
      attributedText = attributedString
    }
  }
}
