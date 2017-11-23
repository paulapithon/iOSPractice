//
//  ImageViewController.swift
//  Image Book
//
//  Created by Paula on 23/11/17.
//  Copyright © 2017 Paula Pithon. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var category: UILabel!
    var landmark = Landmark()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = landmark.name
        image.image = landmark.image
        category.text = landmark.category
        
    }

}
