//
//  ViewController.swift
//  Birthday Note Taker
//
//  Created by Paula on 20/11/17.
//  Copyright © 2017 Paula Pithon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var birthdayText: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var birthdayLabel: UILabel!

    //Created constants to make easier and safer to access
    let name = "name"
    let birthday = "bday"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //if let checks if the object is stored as the required type
        if let previousName = UserDefaults.standard.object(forKey: name) as? String {
            nameLabel.text = "Stored name: \(previousName)"
        }
        
        //use _ instead of constant name if you're not going to use it
        if let previousBday = UserDefaults.standard.object(forKey: birthday) as? String {
            birthdayLabel.text = "Stored birthday: \(previousBday)"
        }
    
    }

    @IBAction func saveBtn(_ sender: Any) {
        
        //Syncronize necessary to save info at the end
        UserDefaults.standard.set(nameText.text!, forKey: birthday)
        UserDefaults.standard.set(birthdayText.text!, forKey: name)
        UserDefaults.standard.synchronize()
        
        nameLabel.text = "Stored name: \(nameText.text!)"
        birthdayLabel.text = "Stored birthday: \(birthdayText.text!)"
        
    }
    
    @IBAction func deleteBtn(_ sender: Any) {
        
        //Removes object with key
        if (UserDefaults.standard.object(forKey: name) as? String) != nil {
            UserDefaults.standard.removeObject(forKey: name)
            nameLabel.text = "Stored name: "
        }
        
        //If you're not goind to use the constant (as above) just check if not nil
        if (UserDefaults.standard.object(forKey: birthday) as? String) != nil {
            UserDefaults.standard.removeObject(forKey: birthday)
            birthdayLabel.text = "Stored birthday: "
        }
        
    }

}

