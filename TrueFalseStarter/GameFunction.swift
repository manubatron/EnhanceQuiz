//
//  GameFunction.swift
//  TrueFalseStarter
//
//  Created by Julius Manubay on 10/24/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import GameKit

var triviaProvider = TriviaProvider()

let triviaCounter = triviaProvider.triviaCounter()
let viewController = ViewController()
var questionsAsked = 0
var correctQuestions = 0




class GameFunctions {
    
    var indexOfQuestion = triviaProvider.indexGenerator()
    
    // function to determine the amount of answers correct
    func displayScore() -> String {
        
       let playerScore = "Way to go! You got \(correctQuestions) out of \(triviaCounter) correct!"
        
        return playerScore
        // code to play game sound goes here
        
    }

    
    // substituted check answer function to include logic for 3 or 4 answer, questions
    func checkAnswer(quizAnswer answer: String) -> String {
        
        
        
        let correctAnswer = triviaProvider.triviaAnswer(indexVariable: indexOfQuestion )
        var resultMessage: String
        
        if answer == correctAnswer {
            correctQuestions += 1
            resultMessage = "Correct!"
            triviaProvider.triviaSorter(indexVariable: indexOfQuestion)
            indexOfQuestion = triviaProvider.indexGenerator()
            loadNextRoundWithDelay(seconds: 5)
        } else {
            resultMessage = "Sorry, wrong answer! The correct answer was \(correctAnswer)!"
            triviaProvider.triviaSorter(indexVariable: indexOfQuestion)
            indexOfQuestion = triviaProvider.indexGenerator()
            loadNextRoundWithDelay(seconds: 5)
        }
        
        return resultMessage
    
    }

    func nextRound() {
        if triviaCounter == 0 {
            // Game is over -> Play sound here
            triviaProvider.triviaReset()
            displayScore()
        } else {
            // Continue game
            viewController.displayQuestion()
        }
    }

    func playAgain() {
        // Show the answer buttons
        // Sound and countdown signaling second round
        // trueButton.isHidden = false
        // falseButton.isHidden = false
        
        questionsAsked = 0
        correctQuestions = 0
        triviaProvider.triviaReset()
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
