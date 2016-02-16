//
//  PropertiesRepository.swift
//  Practical
//
//  Created by Peter Lafferty on 16/02/2016.
//  Copyright © 2016 Peter Lafferty. All rights reserved.
//

import Foundation
import Alamofire

public struct PropertiesRepository {
    private let baseURLString = "https://private-4219-practical.apiary-mock.com/properties/"


    public func property(propertyId:Int, completionHandler: Result<Property> -> Void) {
        let url = "\(baseURLString)\(propertyId)"
        
        
        Alamofire.request(.GET, url).responseJSON { (response) -> Void in
            switch response.result {
            case .Success(let data):
                do {
                    let property = try Property.decode(data)
                    completionHandler(.Success(property))
                } catch {
                    completionHandler(.Error(error))
                }
            case .Failure(let error):
                completionHandler(.Error(error))
            }
            
        }
        

    }
    
}