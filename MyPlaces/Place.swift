//
//  Place.swift
//  MyPlaces
//
//  Created by Adam Noffsinger on 11/30/16.
//  Copyright © 2016 Adam Noffsinger. All rights reserved.
//

import UIKit

class Place {
    
    // initialize stored properties, with question mark indicating optional values
    var name: String
    var photo: UIImage
    var tags: Array<Any>
    var address: String
    
    init?(name: String, photo: UIImage, tags: Array<Any>, address: String) {
        self.name = name
        self.photo = photo
        self.tags = tags
        self.address = address
        
        // failure if no name value
        if name.isEmpty {
            return nil
        }
    }
}
