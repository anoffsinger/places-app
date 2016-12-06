//
//  Common.swift
//  MyPlaces
//
//  Created by Adam Noffsinger on 12/5/16.
//  Copyright © 2016 Adam Noffsinger. All rights reserved.
//

import UIKit

func convertValue(inputValue: CGFloat, r1Min: CGFloat, r1Max: CGFloat, r2Min: CGFloat, r2Max: CGFloat) -> CGFloat {
    let ratio = (r2Max - r2Min) / (r1Max - r1Min)
    return inputValue * ratio + r2Min - r1Min * ratio
}
