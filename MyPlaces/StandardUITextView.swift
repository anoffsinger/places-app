//
//  StandardUITextView.swift
//  Nomad
//
//  Created by Adam Noffsinger on 12/6/16.
//  Copyright © 2016 Adam Noffsinger. All rights reserved.
//

import UIKit

class StandardTextView: UITextView {
    let lightGrey = UIColor(red:0.96, green:0.96, blue:0.96, alpha:1.0)
    let standardTextFieldFontStyle = UIFont.systemFont(ofSize: 16.0, weight: UIFontWeightRegular)
    let purple = UIColor(red:0.63, green:0.47, blue:0.73, alpha:1.0)
    let padding = UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 10);
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.backgroundColor = lightGrey
        self.layer.cornerRadius = 4.0
        self.font = standardTextFieldFontStyle
        self.textContainerInset = padding
    }
    
    
}
