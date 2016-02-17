//
//  DetailViewController.swift
//  Practical
//
//  Created by Peter Lafferty on 16/02/2016.
//  Copyright © 2016 Peter Lafferty. All rights reserved.
//

import UIKit
import PracticalKit

class PropertyViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!


    var property: Property? {
        didSet {
            self.configureView()
        }
    }

    func configureView() {
        if let property = self.property {
            if let label = self.detailDescriptionLabel {
                label.text = property.name
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

