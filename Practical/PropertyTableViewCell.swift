//
//  PropertyTableViewCell.swift
//  Practical
//
//  Created by Peter Lafferty on 16/02/2016.
//  Copyright © 2016 Peter Lafferty. All rights reserved.
//

import UIKit
import PracticalKit

class PropertyTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var thumbnailImage: UIImageView!
    
    var property:Property? {
        didSet {
            guard let p = property else {
                nameLabel.text = ""
                priceLabel.text = ""
                ratingLabel.text = ""
                typeLabel.text = ""
                thumbnailImage.image = nil
                return
            }
            
            nameLabel.text = p.name

            if let rating = p.rating {
                ratingLabel.text = "\(rating)/100"
            } else {
                ratingLabel.text = "No Rating"
            }
            
            if let currency = p.currency, let price = p.price {
                priceLabel.text = "\(currency) \(price)"
            } else {
                priceLabel.text = ""
            }
            typeLabel.text = p.type
            
            
            if let image = p.image.first, let url = image[.Small] {
                thumbnailImage.af_setImageWithURL(url)
            }
        }
    }
    
    static var identifier: String {
        return "PropertyCell"
    }
}
