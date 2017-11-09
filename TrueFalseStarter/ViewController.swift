//
//  ViewController.swift
//  TrueFalseStarter
//
//  Created by Pasan Premaratne on 3/9/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//

import UIKit
import GameKit
import AudioToolbox

class ViewController: UIViewController {
    
    //Separated array into seperate file and question/answer functions.
    var triviaProvider = TriviaProvider()
    
    // Functions for the Game
    var gameFunctions = GameFunctions()
   
    
    @IBOutlet weak var questionField: UILabel!
    @IBOutlet weak var answerButton1: UIButton!
    @IBOutlet weak var answerButton2: UIButton!
    @IBOutlet weak var answerButton3: UIButton!
    @IBOutlet weak var answerButton4: UIButton!
    @IBOutlet weak var playAgainButton: UIButton!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // gameStartSound refers to the GameSounds struct on the GameSounds file.
        let gameStartSound = GameSounds()
        
        gameStartSound.loadGameStartSound()
        // Start game
        gameStartSound.playGameStartSound()
        
        displayQuestion()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Function should be pulling an question from the array with the index generated on the game functions page. The titles for each button should change as well depending on each index generated... However I cannot figure out why the next question always results in nil. (╯°□°）╯︵ ┻━┻
    func displayQuestion() {
        questionField.text = triviaProvider.randomTrivia(indexVariable: gameFunctions.indexOfQuestion)
        answerButton1.setTitle("\(triviaProvider.questionAnswers1(indexVariable: gameFunctions.indexOfQuestion))", for: .normal)
        answerButton2.setTitle("\(triviaProvider.questionAnswers2(indexVariable: gameFunctions.indexOfQuestion))", for: .normal)
        answerButton3.setTitle("\(triviaProvider.questionAnswers3(indexVariable: gameFunctions.indexOfQuestion))", for: .normal)
        answerButton4.setTitle("\(triviaProvider.questionAnswers4(indexVariable: gameFunctions.indexOfQuestion))", for: .normal)
    }
    

    
    func displayScore() {
        // Hide the answer buttons
        answerButton1.isHidden = true
        answerButton2.isHidden = true
        answerButton3.isHidden = true
        answerButton4.isHidden = true
        
        // Display play again button
        playAgainButton.isHidden = false
        
        questionField.text = gameFunctions.displayScore()
        
    }
    
    // function should convert the button selected into a variable to determine the correct answer
    @IBAction func checkAnswer(_ playerAnswer: UIButton) {


        let buttonValue = playerAnswer.titleLabel?.text
        
        questionField.text = gameFunctions.checkAnswer(quizAnswer: buttonValue!)

    }
    
    // Refers to the function in gamefunctions to play again.
    @IBAction func playAgain() {

        answerButton1.isHidden = false
        answerButton2.isHidden = false
        answerButton3.isHidden = false
        answerButton4.isHidden = false
        
        gameFunctions.playAgain()
        
    }

    
    
}

