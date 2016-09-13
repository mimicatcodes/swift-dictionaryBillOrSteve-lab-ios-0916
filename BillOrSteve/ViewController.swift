//
//  ViewController.swift
//  BillOrSteve
//
//  Created by James Campagno on 6/8/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var facts:[String:[String]] = [
        
        "Steve Jobs" : [
            "He took a calligraphy course, which he says was instrumental in the future company products' attention to typography and font.",
            "Shortly after being shooed out of his company, he applied to fly on the Space Shuttle as a civilian astronaut (he was rejected) and even considered starting a computer company in the Soviet Union.",
            "He actually served as a mentor for Google founders Sergey Brin and Larry Page, even sharing some of his advisers with the Google duo.",
            "He was a pescetarian, meaning he ate no meat except for fish."],
        
        "Bill Gates" :[
            "He aimed to become a millionaire by the age of 30. However, he became a billionaire at 31.",
            "He scored 1590 (out of 1600) on his SATs.",
            "His foundation spends more on global health each year than the United Nation's World Health Organization.",
            "The private school he attended as a child was one of the only schools in the US with a computer. The first program he ever used was a tic-tac-toe game.",
            "In 1994, he was asked by a TV interviewer if he could jump over a chair from a standing position. He promptly took the challenge and leapt over the chair like a boss."]
    ]
    
    var count = 1
    var scoreTotal = 0
    
    @IBOutlet weak var counter: UILabel!
    @IBOutlet weak var factDisplay: UILabel!
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var gameOver: UILabel!
    
    @IBAction func steveButton(sender: AnyObject) {
        if count < 9 {
            if let steveFact = facts["Steve Jobs"] {
                if steveFact.contains(factDisplay.text!){
                    print("Steve Jobs")
                    count += 1
                    scoreTotal += 1
                    showFact()
                } else {
                    print("No, it's Bill Gates!")
                    count += 1
                    showFact()
                }
            }
        } else if count == 9 {
            if let steveFact = facts["Steve Jobs"] {
                if steveFact.contains(factDisplay.text!){
                    print("Steve Jobs")
                    scoreTotal += 1
                    showScore()
                    gameEnds()
                } else {
                    print("No, it's Bill Gates!")
                    showScore()
                    gameEnds()
                }
            }
        } else {
            score.hidden = true
        }
        counter.text = "\(count)/9"
    }
    
    
            //only check to see if dictionay[steve] contains label.text
        //handle points up or no change
        //call showfact

    @IBAction func billButton(sender: AnyObject) {
        if count < 9 {
            if let billFact = facts["Bill Gates"]{
                if billFact.contains(factDisplay.text!){
                    print("Bill Gates")
                    count += 1
                    scoreTotal += 1
                    showFact()
                } else {
                    print("No, it's Steve Jobs!")
                    count += 1
                    showFact()
                }
            }
        } else if count == 9 {
            if let billFact = facts["Bill Gates"]{
                if billFact.contains(factDisplay.text!){
                    print("Bill Gates")
                    scoreTotal += 1
                    showScore()
                    gameEnds()
                } else {
                    print("No, it's Steve Jobs!")
                    showScore()
                    gameEnds()
                }
            }
        } else {
            score.hidden = true
        }
        counter.text = "\(count)/9"
    }

        
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        counter.text = "\(count)/9"
        score.hidden = true
        gameOver.hidden = true
        showFact()
    }
    
    func randomNumberFromZeroTo(number: Int) -> Int {
        return Int(arc4random_uniform(UInt32(number)))
    }
    
    func randomPerson() -> String {
        let randomNumber = arc4random_uniform(2)
        
        if randomNumber == 0 {
            return "Steve Jobs"
        } else {
            return "Bill Gates"
        }
    }
    
    func getRandomFact()->(name:String, fact:String)?{
        
        let randomIndexNumSteve = randomNumberFromZeroTo(facts["Steve Jobs"]!.count)
        let randomIndexNumBill = randomNumberFromZeroTo(facts["Bill Gates"]!.count)
        
        if randomPerson() == "Steve Jobs" {
            if let fact = facts["Steve Jobs"]?[randomIndexNumSteve] {
                return ("Steve Jobs", fact)
            }
            
            
        } else {
            if let fact = facts["Bill Gates"]?[randomIndexNumBill] {
                return ("Bill Gates", fact)
            }
        }
        
        return nil
        
    }
    
    
    func showFact(){
        
        factDisplay.text = getRandomFact()!.fact
  
        
    }
    
    func showScore(){
        if count == 9 {
            score.hidden = false
            score.text = String(scoreTotal)
        }
    }
    
 
    
    func gameEnds(){
        if count == 9 {
            gameOver.hidden = false
            gameOver.text = "Game Over"
        }
    }
}