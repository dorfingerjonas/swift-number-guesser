//
//  ViewController.swift
//  swift-number-guesser
//
//  Created by Administrator on 21.10.20.
//  Copyright © 2020 Jonas Dorfinger. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let model = Model()
    
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(model.numberToGuess)
    }


    @IBAction func guess(_ sender: Any) {
        if model.gameWon {
            model.clear()
            print(model.numberToGuess)
        }
        
        let guessedValue = Int(textField.text!)!
        
        model.guesses.append(guessedValue)
        
        if model.numberToGuess == guessedValue || model.guesses.count == 10 {
            model.gameWon = true
            performSegue(withIdentifier: "win", sender: self)
        }
        
        textField.text = ""
    }
    
    @IBAction func reset(_ sender: Any) {
        model.clear()
        textField.text = ""
        print(model.numberToGuess)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "win" {
            let tableViewController = segue.destination as! TableViewController
            
            tableViewController.model = self.model
        }
    }
}
