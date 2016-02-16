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


    public func property(propertyId:Int, completionHandler: Result<[Int]> -> Void) {
        let url = "\(baseURLString)\(propertyId)"
        
        
        Alamofire.request(.GET, url).responseJSON { (response) -> Void in
            switch response.result {
            case .Success(let value):
                print(value)
                        completionHandler(.Success([1]))
            case .Failure(let error):
                print(error)
                        completionHandler(.Success([1]))
            }
            
        }
        

    }
    
}