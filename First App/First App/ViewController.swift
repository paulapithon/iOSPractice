//
//  ViewController.swift
//  First App
//
//  Created by Paula on 20/11/17.
//  Copyright © 2017 Paula Pithon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var text: UILabel!
    var isSmart = true
    
    @IBAction func button(_ sender: Any) {
        if (isSmart) {
            text.text = "Is super smart"
            isSmart = false
        } else {
            text.text = "Paula Pithon"
            isSmart = true
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

