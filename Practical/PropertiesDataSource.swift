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
    
    convenience init(completionHandler:@escaping (Void) -> (Void)) {
        self.init()
        CitiesRepository().properties { (result) -> Void in
            switch result {
            case .success(let properties):
                self.properties = properties
            case .error(_):
                ()
            }
            completionHandler()
        }
    }
    
    func propertyAtIndex(_ indexPath: IndexPath) -> Property {
        return properties[indexPath.row]
    }
    
    subscript(index: Int) -> Property {
        get {
            return properties[index]
        }
    }
    
    subscript(indexPath: IndexPath) -> Property {
        get {
            return properties[indexPath.row]
        }
    }
}

extension PropertiesDataSource: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return properties.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PropertyTableViewCell.identifier, for: indexPath) as! PropertyTableViewCell
        
        let property = properties[indexPath.row]
        cell.property = property        
        
        return cell
    }
    
}

extension PropertiesDataSource: UITableViewDelegate {

}
