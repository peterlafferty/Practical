//
//  MasterViewController.swift
//  Practical
//
//  Created by Peter Lafferty on 16/02/2016.
//  Copyright © 2016 Peter Lafferty. All rights reserved.
//

import UIKit
import PracticalKit

class MasterViewController: UITableViewController {

    var detailViewController: PropertyViewController? = nil
    var dataSource = PropertiesDataSource()


    override func viewDidLoad() {
        super.viewDidLoad()

        if let split = self.splitViewController {
            let controllers = split.viewControllers
            self.detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? PropertyViewController
        }
        
        dataSource = PropertiesDataSource(completionHandler: {
            dispatch_async(dispatch_get_main_queue(),{
                self.tableView.reloadData()
            })
            
        })
        
        tableView.dataSource = dataSource
        tableView.delegate = dataSource
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Segues

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        print("prepareForSegue")

        if segue == .ShowProperty {
            
            if let indexPath = self.tableView.indexPathForSelectedRow {
                if let navigationController = segue.destinationViewController as? UINavigationController {
                    if let controller = navigationController.topViewController as? PropertyViewController {
                        controller.property = dataSource[indexPath]
                    }
                }
            }
        }
    }

    // MARK: - Table View
}
