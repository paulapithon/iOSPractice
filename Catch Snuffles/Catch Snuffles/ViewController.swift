//
//  ViewController.swift
//  Catch Snuffles
//
//  Created by Paula on 21/11/17.
//  Copyright © 2017 Paula Pithon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var snuffles0: UIImageView!
    @IBOutlet weak var snuffles1: UIImageView!
    @IBOutlet weak var snuffles2: UIImageView!
    @IBOutlet weak var snuffles3: UIImageView!
    @IBOutlet weak var snuffles4: UIImageView!
    @IBOutlet weak var snuffles5: UIImageView!
    @IBOutlet weak var snuffles6: UIImageView!
    @IBOutlet weak var snuffles7: UIImageView!
    @IBOutlet weak var snuffles8: UIImageView!
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var highscoreLabel: UILabel!
    
    var snuffleArray = [UIImageView]()
    var score = 0
    var highscore = 0
    var counter = 30
    var timer = Timer()
    var hideTimer = Timer()
    
    let highscoreCheck = "highscore"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Text and timer setup
        setupUI()
        
        //Image array setup
        snuffleArray = [snuffles0, snuffles1, snuffles2, snuffles3, snuffles4, snuffles5, snuffles6, snuffles7, snuffles8]
        setOnClickSnuffle()
        
        //Check highscore
        if let newScore = UserDefaults.standard.object(forKey: highscoreCheck) as? Int {
            highscore = newScore
        }
    
    }
    
    func setupUI () {
        //Initial values
        score = 0
        counter = 30
        //Initial texts
        scoreLabel.text = "Score: \(score)"
        timerLabel.text = "\(counter)"
        highscoreLabel.text = "Highscore: \(highscore)"
        //Initial timer
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.countDown), userInfo: nil, repeats: true)
        hideTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(ViewController.hideSnuffles), userInfo: nil, repeats: true)
    }
    
    func setOnClickSnuffle () {
        //Add recognizers
        for snuffle in snuffleArray {
            let recognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.increaseScore))
            snuffle.addGestureRecognizer(recognizer)
            snuffle.isUserInteractionEnabled = true
        }
    }
    
    @objc func increaseScore () {
        score += 1
        scoreLabel.text = "Score: \(score)"
    }
    
    @objc func countDown () {
        counter = counter - 1
        timerLabel.text = "\(counter)"
        
        if counter == 0 {
            //Check highscore
            if score > highscore {
                highscoreLabel.text = "Highscore: \(score)"
                UserDefaults.standard.set(score, forKey: highscoreCheck)
            }
            //Create alert
            timer.invalidate()
            hideTimer.invalidate()
            let alert = UIAlertController(title: "Time!", message: "Your time is up!", preferredStyle: UIAlertControllerStyle.alert)
            let ok = UIAlertAction(title: "Done", style: UIAlertActionStyle.default, handler: nil)
            let replay = UIAlertAction(title: "Replay", style: UIAlertActionStyle.default, handler: {(UIAlertAction) in
                    self.setupUI()
                })
            alert.addAction(ok)
            alert.addAction(replay)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @objc func hideSnuffles () {
        for snuffle in snuffleArray {
            snuffle.isHidden = true
        }
        //Generate random number
        let randomNumber = Int(arc4random_uniform(UInt32(snuffleArray.count - 1)))
        snuffleArray[randomNumber].isHidden = false
    }

}

