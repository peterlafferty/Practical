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
    fileprivate let baseURLString = "https://private-84164-practical3.apiary-mock.com/properties/"

    public init() {
        //let bundle = Bundle(identifier: "com.peterlafferty.PracticalKit")
        //print(bundle?.infoDictionary?["API"])
    }
    
    public func property(_ propertyId:String, completionHandler: @escaping (Result<Property>) -> Void) {
        let url = "\(baseURLString)\(propertyId)"
        
        
        Alamofire.request(url).responseJSON { (response) -> Void in
            switch response.result {
            case .success(let data):
                do {
                    let property = try Property.decode(data)
                    completionHandler(.success(property))
                } catch {
                    completionHandler(.error(error))
                }
            case .failure(let error):
                completionHandler(.error(error))
            }
            
        }
        

    }
    
}
