//
//  ViewController.swift
//  Guessing Game
//
//  Created by Mason Nesbitt on 9/24/18.
//  Copyright © 2018 Mason Nesbitt. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var reset: UIButton!
    @IBOutlet weak var triesRemaining: UILabel!
    @IBOutlet weak var greetingLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var guessStatusLabel: UILabel!
    @IBOutlet weak var submit: UIButton!
    @IBOutlet weak var triesRemainingInt: UILabel!
    
    var playAgainBool = false
    var number = Int(arc4random_uniform(99)) + 1
    let input = readLine()
    var counter = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gameStart()
    }
    
    func gameStart(){
        number = Int(arc4random_uniform(99)) + 1
        counter += 5
        triesRemainingInt.text = " \(counter)"
        greetingLabel.text = """
                                                        Welcome to the Guessing Game.
                                                        Plese Enter a Number
                                                        """
    }
    
    
    func playAgain(){
        guessStatusLabel.text = "Would you like to play again? Y/N"
        if textField.text?.lowercased() == "yes"{
            gameStart()
        } else{
            guessStatusLabel.text = "Thanks for Playing"
        }
    }
    
    
    @IBAction func guessTest(_ sender:UIButton) {
        if counter < 4 {
            var textFieldInt: Int? = Int(textField.text!)
            if textField.text == ""{
                textFieldInt = 0
            }
            if textFieldInt == number {
                guessStatusLabel.text = "You win!"
                playAgain()
            }
            if textFieldInt! > number {
                guessStatusLabel.text = "Guess too High. Please Try again."
                counter += 1
            }
            else {
                guessStatusLabel.text = "Guess Too Low. Please Try Again."
                counter += 1
            }
    }else {
            guessStatusLabel.text = "Sorry you are out of guesses. /nThe correct number was \(number)"
            playAgain()
        }
        
    }
    
    
    

}
