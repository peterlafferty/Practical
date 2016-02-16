//
//  Image.swift
//  Practical
//
//  Created by Peter Lafferty on 16/02/2016.
//  Copyright © 2016 Peter Lafferty. All rights reserved.
//

import Foundation
import Decodable

public struct Image {
    
    public enum Size: String {
        case Original = "_base"
        case Small = "_40"
        case Large = "_80"
    }
    
    private let suffix: String
    private let prefix: String
    
    public subscript(size: Size) -> NSURL? {
        return NSURL(string: prefix + size.rawValue + suffix)
    }
}

extension Image: Decodable {
    public static func decode(j: AnyObject) throws -> Image {
        return try Image(
            suffix: j => "suffix",
            prefix: j => "prefix"
        )
    }
}