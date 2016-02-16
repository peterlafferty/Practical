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
    let name:String
    let id:String
    let price:Double?
    let currency:String?
    let rating: Int?
    let type:String
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
            type: j => "type"
        )
    }
}


