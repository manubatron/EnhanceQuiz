//
//  TriviaProvider.swift
//  TrueFalseStarter
//
//  Created by Julius Manubay on 10/24/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import GameKit

struct TriviaProvider {

    let trivia: [[String : String]] = [
        ["Question": "Only female koalas can whistle", "Answer": "False"],
        ["Question": "Blue whales are technically whales", "Answer": "True"],
        ["Question": "Camels are cannibalistic", "Answer": "False"],
        ["Question": "All ducks are birds", "Answer": "True"]
    ]
    
    // Function to determine the index number of the array
    func indexGenerator() -> Int {
        
        let indexOfSelectedQuestion = GKRandomSource.sharedRandom().nextInt(upperBound: trivia.count)
        
        return indexOfSelectedQuestion
    }
    
    // Function to determine the question
    mutating func randomTrivia() -> String {
        return trivia[indexGenerator()]["Question"]!
        
    }
    
    // Function to determine the answer
    mutating func triviaAnswer() -> String {
        return trivia[indexGenerator()]["Answer"]!
        
    }
}
