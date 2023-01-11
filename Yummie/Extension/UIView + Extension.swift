//
//  UIView + Extension.swift
//  Yummie
//
//  Created by Dmitry Samusenko on 28.12.2022.
//

import UIKit

extension UIView {
   @IBInspectable var cornerRadius: CGFloat {
       get { return self.cornerRadius }
        set {
            self.layer.cornerRadius = newValue
        }
    }
}
