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
    var latitude: Double
    var longitude: Double
    
    init?(name: String, photo: UIImage?, tags: String, description: String, latitude: Double, longitude: Double) {
        self.name = name
        self.photo = photo
        self.tags = tags
        self.description = description
        self.latitude = latitude
        self.longitude = longitude
    }
}
