//
//  PropertiesDataSource.swift
//  Practical
//
//  Created by Peter Lafferty on 16/02/2016.
//  Copyright © 2016 Peter Lafferty. All rights reserved.
//

import UIKit
import PracticalKit
import AlamofireImage

class PropertiesDataSource: NSObject {
    var properties = [Property]()
    var selectedProperty: Property?
    
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
    
    func propertyAtIndex(indexPath: NSIndexPath) -> Property {
        return properties[indexPath.row]
    }
    
    subscript(index: Int) -> Property {
        get {
            return properties[index]
        }
    }
    
    subscript(indexPath: NSIndexPath) -> Property {
        get {
            return properties[indexPath.row]
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
        let cell = tableView.dequeueReusableCellWithIdentifier(PropertyTableViewCell.identifier, forIndexPath: indexPath) as! PropertyTableViewCell
        
        let property = properties[indexPath.row]
        cell.property = property        
        
        return cell
    }
    
}

extension PropertiesDataSource: UITableViewDelegate {

}