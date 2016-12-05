//
//  CollectionTableViewCell.swift
//  MyPlaces
//
//  Created by Adam Noffsinger on 11/27/16.
//  Copyright © 2016 Adam Noffsinger. All rights reserved.


import UIKit

class CollectionTableViewCell: UITableViewCell {

    
    @IBOutlet weak var backgroundShadowView: UIView!
    @IBOutlet weak var backgroundCardView: UIView!
    @IBOutlet weak var collectionLabel: UILabel!
    @IBOutlet weak var numberPlacesLabel: UILabel!
    @IBOutlet weak var collectionImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
    
//        backgroundCardView.backgroundColor = UIColor.gray
        contentView.backgroundColor = UIColor.white
        backgroundCardView.layer.cornerRadius = 4.0
        backgroundCardView.layer.masksToBounds = true
        // the cg portion here is converting this to a cg color, I think?
        backgroundShadowView.layer.shadowColor = UIColor.black.cgColor
        backgroundShadowView.layer.shadowOffset = CGSize(width: 0, height: 10)
        backgroundShadowView.layer.shadowOpacity = 0.07
        backgroundShadowView.layer.shadowRadius = 10
        
        collectionImageView.alpha = 0.7
    }
    
    
    
    

}
