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
    
    let questionsPerRound = 0
    var questionsAsked = 0
    var correctQuestions = 0
    var indexOfSelectedQuestion: Int = 0
    
    
    
    
   
    
    @IBOutlet weak var questionField: UILabel!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
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
    
    @IBAction func displayQuestion() {
        questionField.text = triviaProvider.randomTrivia()
    }

    
    func displayScore() {
        // Hide the answer buttons
        trueButton.isHidden = true
        falseButton.isHidden = true
        
        // Display play again button
        playAgainButton.isHidden = false
        
        questionField.text = "Way to go!\nYou got \(correctQuestions) out of \(questionsPerRound) correct!"
        
    }
    
    @IBAction func checkAnswer(_ sender: UIButton) {
        // Increment the questions asked counter
        questionsAsked += 1
        
        //let selectedQuestionDict = triviaProvider.trivia[indexOfSelectedQuestion]
        let correctAnswer = triviaProvider.triviaAnswer()
        
        if (sender === trueButton &&  correctAnswer == "True") || (sender === falseButton && correctAnswer == "False") {
            correctQuestions += 1
            questionField.text = "Correct!"
        } else {
            questionField.text = "Sorry, wrong answer!"
        }
        
        loadNextRoundWithDelay(seconds: 5)
        // Code to display seconds till next question here...
    }
    
    func nextRound() {
        if questionsAsked == questionsPerRound {
            // Game is over -> Play sound here
            displayScore()
        } else {
            // Continue game
            displayQuestion()
        }
    }
    
    @IBAction func playAgain() {
        // Show the answer buttons
        // Sound and countdown signaling second round
        trueButton.isHidden = false
        falseButton.isHidden = false
        
        questionsAsked = 0
        correctQuestions = 0
        nextRound()
    }
    

    
    // MARK: Helper Methods
    
    func loadNextRoundWithDelay(seconds: Int) {
        // Converts a delay in seconds to nanoseconds as signed 64 bit integer
        let delay = Int64(NSEC_PER_SEC * UInt64(seconds))
        // Calculates a time value to execute the method given current time and delay
        let dispatchTime = DispatchTime.now() + Double(delay) / Double(NSEC_PER_SEC)
        
        // Executes the nextRound method at the dispatch time on the main queue
        DispatchQueue.main.asyncAfter(deadline: dispatchTime) {
            self.nextRound()
        }
    }
    
    
}

