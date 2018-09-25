//
//  ViewController.swift
//  Guessing Game
//
//  Created by Mason Nesbitt on 9/24/18.
//  Copyright © 2018 Mason Nesbitt. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var triesRemaining: UILabel!
    @IBOutlet weak var greetingLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var guessStatusLabel: UILabel!
    @IBOutlet weak var submit: UIButton!
    @IBOutlet weak var triesRemainingInt: UILabel!
    @IBOutlet weak var reset: UIButton!
    @IBOutlet weak var hiddenNumber: UILabel!
    
    var playAgainBool = false
    var number = Int(arc4random_uniform(99)) + 1
    let input = readLine()
    var counter = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gameStart()
    }
    

    @IBAction func onReset2Pressed(_ sender: Any) {
        let alert = UIAlertController(title: "Reset", message: "Are you sure you want to Reset?", preferredStyle: .alert)
        let action1 = UIAlertAction(title: "Restart", style: .default) { (action) in
            self.gameStart()
        }
        alert.addAction(action1)
        present(alert, animated: true, completion: nil)
    }
    func gameStart(){
        number = Int(arc4random_uniform(99)) + 1
        counter = 4
        triesRemainingInt.text = " \(counter)"
        greetingLabel.text = """
                                                        Welcome to the Guessing Game.
                                                        Plese Enter a Number
                                                        """
        guessStatusLabel.text = ""
        hiddenNumber.text = ""
    }
    
    
    func playAgain(){
        let alert = UIAlertController(title: "Game Over", message: "Would you like to Play Again?", preferredStyle: .alert)
        let action1 = UIAlertAction(title: "Restart", style: .default) { (action) in
            self.gameStart()
        }
        alert.addAction(action1)
        present(alert, animated: true, completion: nil)
    }
    
    
    
    @IBAction func guessTest(_ sender:UIButton) {
        if counter != 0 {
            guard let textFieldInt = Int(textField.text!) else{
                guessStatusLabel.text = "Please Enter a Number"
                return
            }
            if textFieldInt == number {
                guessStatusLabel.text = "You win!"
                playAgain()
                triesRemainingInt.text = " \(counter)"
            }
            if textFieldInt > number {
                guessStatusLabel.text = "Guess too High. Please Try again."
                counter -= 1
                triesRemainingInt.text = " \(counter)"
            }
            else {
                guessStatusLabel.text = "Guess Too Low. Please Try Again."
                counter -= 1
                triesRemainingInt.text = " \(counter)"
            }
    }else {
            guessStatusLabel.text = "Sorry you are out of Guesses"
            playAgain()
            hiddenNumber.text = "\(number)"
        }

    }
    
    
    

}
