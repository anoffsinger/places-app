//
//  Collection.swift
//  MyPlaces
//
//  Created by Adam Noffsinger on 11/27/16.
//  Copyright © 2016 Adam Noffsinger. All rights reserved.
//

import UIKit

class Collection {
    
    // initialize stored properties, with question mark indicating optional values
    var name: String
    // questionmark defines as optional
    var photo: UIImage?
    var numberPlaces: Int
    
    init?(name: String, photo: UIImage?, numberPlaces: Int) {
        self.name = name
        self.photo = photo
        self.numberPlaces = numberPlaces
    }
}
