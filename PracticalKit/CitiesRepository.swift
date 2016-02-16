//
//  CitiesRepository.swift
//  Practical
//
//  Created by Peter Lafferty on 16/02/2016.
//  Copyright © 2016 Peter Lafferty. All rights reserved.
//

import Foundation
import Alamofire
import Decodable

public struct CitiesRepository {
    private let url = NSURL(string: "https://private-4219-practical.apiary-mock.com/cities/1530/properties/")!
    
    public func properties(completionHandler: Result<[Property]> -> Void) {

        Alamofire.request(.GET, url).responseJSON { (response) -> Void in
            switch response.result {
            case .Success(let data):
                
                do {
                    let properties = try [Property].decode(data => "properties")
                    completionHandler(.Success(properties))
                } catch {
                    completionHandler(.Error(error))
                }

            case .Failure(let error):
                completionHandler(.Error(error))
            }
            
        }
    }
    
}