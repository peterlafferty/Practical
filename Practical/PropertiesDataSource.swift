//
//  PropertiesDataSource.swift
//  Practical
//
//  Created by Peter Lafferty on 16/02/2016.
//  Copyright © 2016 Peter Lafferty. All rights reserved.
//

import UIKit
import PracticalKit

class PropertiesDataSource: NSObject {
    var properties = [Property]()
    convenience init(completionHandler:(Void) -> (Void)) {
        self.init()
        CitiesRepository().properties { (result) -> Void in
            switch result {
            case .Success(let properties):
                self.properties = properties
            case .Error(_):
                ()
            }
            completionHandler()
        }
    }
}

extension PropertiesDataSource: UITableViewDataSource {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return properties.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCellWithIdentifier("PropertyCell", forIndexPath: indexPath) as? PropertyTableViewCell else {
            return UITableViewCell()
        }
        
        let property = properties[indexPath.row]
        
        cell.name.text = property.name
        
        if let rating = property.rating {
            cell.rating.text = "\(rating)/100"
        } else {
            cell.rating.text = "No Rating"
        }
        
        if let currency = property.currency, let price = property.price {
            cell.price.text = "\(currency) \(price)"
        } else {
            cell.price.text = ""
        }
        cell.type.text = property.type
        
        
        
        return cell
    }
    
}

extension PropertiesDataSource: UITableViewDelegate {
    
}