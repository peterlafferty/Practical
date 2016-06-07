//
//  Property.swift
//  Practical
//
//  Created by Peter Lafferty on 16/02/2016.
//  Copyright © 2016 Peter Lafferty. All rights reserved.
//

import Foundation
import Decodable

public struct Property {
    public let name:String
    public let id:String
    public let price:String?
    public let currency:String?
    public let rating: Int?
    public let type:String
    public let image:[Image]
    public let descriptionByProperty:String?
    public let descriptionByEditor:String?
    public let recommends:Bool
}

extension Property: Decodable {
    public static func decode(j: AnyObject) throws -> Property {
        
        var rating:Int? = try? j => "overallRating" => "overall"
        if rating == nil {
            rating = try? j => "rating" => "overall"
        }
        
        return try Property(
            name: j => "name",
            id: j => "id",
            price: try? j => "lowestPricePerNight" => "value",
            currency: try? j => "lowestPricePerNight" => "currency",
            rating: rating,
            type: j => "type",
            image: j => "images",
            descriptionByProperty: try? j => "description",
            descriptionByEditor: try? j => "hostelworldSays",
            recommends: try j => "hostelworldRecommends"
        )
    }
}


