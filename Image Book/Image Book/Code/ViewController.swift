//
//  ViewController.swift
//  Image Book
//
//  Created by Paula on 23/11/17.
//  Copyright © 2017 Paula Pithon. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var landmarkArray = [Landmark]()
    var segueLandmark = Landmark()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Table view setup
        tableView.dataSource = self
        tableView.delegate = self
        //Array creation
        createArray()
    }
    
    func createArray () {
        let nameArray = ["Instituto Ricardo Brennand", "Parque Dois Irmãos", "Museu Cais do Sertão", "Paço do Frevo", "Marco Zero"]
        let imageArray = [UIImage(named: "instituto.jpg")!, UIImage(named: "irmaos.jpeg")!, UIImage(named: "sertao.jpg")!, UIImage(named: "paco.jpg")!, UIImage(named: "zero.jpg")!]
        let categoryArray = ["Museu", "Zoológico", "Museu", "Museu", "Praça"]
        //Create array of landmarks
        for index in 0 ... nameArray.count - 1 {
            let landmark = Landmark()
            landmark.name = nameArray[index]
            landmark.category = categoryArray[index]
            landmark.image = imageArray[index]
            landmarkArray.append(landmark)
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        //Add delete button and its action
        if editingStyle == .delete {
            landmarkArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.fade)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        segueLandmark = landmarkArray[indexPath.row]
        //Method to call the transition
        performSegue(withIdentifier: "openImage", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //Check the identifier before transitioning screens
        if segue.identifier == "openImage" {
            //Get instance of view controller
            let view = segue.destination as! ImageViewController
            //Change its attributes
            view.landmark = segueLandmark
        }
    }
    
    //Needed functions to implement Data Source and Delegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return landmarkArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Create simple cell with label and image
        let cell = UITableViewCell()
        cell.textLabel?.text = landmarkArray[indexPath.row].name
        return cell
    }

}

