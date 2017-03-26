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
    fileprivate let url = URL(string: "https://private-84164-practical3.apiary-mock.com/cities/1530/properties/")!
    
    public init() {
    }
    
    public func properties(_ completionHandler: @escaping (Result<[Property]>) -> Void) {

        Alamofire.request(url).responseJSON { (response) -> Void in
            switch response.result {
            case .success(let data):
                
                do {
                    let properties = try [Property].decode(data => "properties")
                    completionHandler(.success(properties))
                } catch {
                    completionHandler(.error(error))
                }

            case .failure(let error):
                completionHandler(.error(error))
            }
            
        }
    }
    
}
