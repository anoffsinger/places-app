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
    var photo: UIImage?
    var tags: String
    var description: String
    
    
    init?(name: String, photo: UIImage?, tags: String, description: String) {
        self.name = name
        self.photo = photo
        self.tags = tags
        self.description = description
    }
}
