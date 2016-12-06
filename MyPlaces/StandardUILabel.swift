//
//  StandardUILabel.swift
//  MyPlaces
//
//  Created by Adam Noffsinger on 12/5/16.
//  Copyright © 2016 Adam Noffsinger. All rights reserved.
//

import UIKit

class StandardTextField: UITextField {
    
    let lightGrey = UIColor(red:0.96, green:0.96, blue:0.96, alpha:1.0)
    let standardTextFieldFontStyle = UIFont.systemFont(ofSize: 16.0, weight: UIFontWeightRegular)
    
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        self.backgroundColor = lightGrey
        self.layer.cornerRadius = 4.0
        self.font = standardTextFieldFontStyle
        self.borderStyle = UITextBorderStyle.none
        
        
        
    }
    
    let padding = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10);
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
}
