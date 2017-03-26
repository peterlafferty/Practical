//
//  DetailViewController.swift
//  Practical
//
//  Created by Peter Lafferty on 16/02/2016.
//  Copyright © 2016 Peter Lafferty. All rights reserved.
//

import UIKit
import PracticalKit
import AlamofireImage

class PropertyViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!

    @IBOutlet weak var editorialDescription: UILabel!
    @IBOutlet weak var imageView: UIImageView!

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
            
            if let label = self.editorialDescription {
                if let descriptionByProperty = property.descriptionByProperty {
                    label.text = descriptionByProperty
                } else {
                    label.text = ""
                }
            }
            
            if let imageView = imageView {
                if let image = property.image.first, let url = image[.Large] {
                    imageView.af_setImage(withURL: url)
                }
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

//        if let toolbarHeight = self.navigationController?.toolbar.frame.height {
//            self.scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: toolbarHeight, right: 0)
//        }
        
        
        guard let property = property else {
            return
        }
        
        PropertiesRepository().property(property.id) { (result) -> Void in
            switch result {
            case .success(let p):
                self.property = p
            case .error(_):
                ()
            }
        }
        
        
        self.configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

