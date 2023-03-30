//
//  TitleLabel.swift
//  tabbar_custom_template_view
//
//  Created by Aigerim on 15.05.2022.
//

import UIKit

class BorderView: UIView {
  
    override func awakeFromNib() {
        backgroundColor = .systemGray6
        }
    
    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        get {
            layer.borderColor.flatMap { UIColor(cgColor: $0) }
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
}
   

