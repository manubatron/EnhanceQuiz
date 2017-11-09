//
//  TriviaProvider.swift
//  TrueFalseStarter
//
//  Created by Julius Manubay on 10/24/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import GameKit

class TriviaProvider {
    
    
    var trivia: [[String : String]] = [
        ["Question": "This was the only US President to serve more than two consecutive terms.", "Option 1": "George Washington", "Option 2": "Franklin D. Roosevelt", "Option 3": "Woodrow Wilson", "Option 4": "Andrew Jackson", "Correct Answer": "Franklin D. Roosevelt"],
        ["Question": "Which of the following countries has the most residents?", "Option 1": "Nigeria", "Option 2": "Russia", "Option 3": "Iran", "Option 4": "Vietnam", "Correct Answer": "Nigeria"],
        ["Question": "In what year was the United Nations founded?", "Option 1": "1918", "Option 2": "1919", "Option 3": "1945", "Option 4": "1954", "Correct Answer": "1945"],
        ["Question": "The Titanic departed from the United Kingdom, where was it supposed to arrive?", "Option 1": "Paris", "Option 2": "Washington D.C.", "Option 3": "New York City", "Option 4": "Boston", "Correct Answer": "New York City"],
        ["Question": "Which nation produces the most oil?", "Option 1": "Iran", "Option 2": "Iraq", "Option 3": "Brazil", "Option 4": "Canada", "Correct Answer": "Canada"],
        ["Question": "Which country has most recently won consecutive World Cups in Soccer?", "Option 1": "Italy", "Option 2": "Brazil", "Option 3": "Argentina", "Option 4": "Spain", "Correct Answer": "Brazil"],
        ["Question": "Which of the following rivers is longest?", "Option 1": "Yagtze", "Option 2": "Mississippi", "Option 3": "Congo", "Option 4": "Mekong", "Correct Answer": "Mississippi"],
        ["Question": "Which city is the oldest?", "Option 1": "Mexico City", "Option 2": "Cape Town", "Option 3": "San Juan", "Option 4": "Sydney", "Correct Answer": "Mexico City"],
        ["Question": "Which country was the first to allow women to vote in national elections?", "Option 1": "Poland", "Option 2": "United States", "Option 3": "Sweden", "Option 4": "Senegal", "Correct Answer": "Poland"],
        ["Question": "Which of these countries won the most medals in the 2012 Summer Games?", "Option 1": "France", "Option 2": "Germany", "Option 3": "Japan", "Option 4": "Great Britain", "Correct Answer": "Great Britain"]
    ]
    
    // Array to hold answered trivia questions -> When game resets this will be cleared.
    var triviaAnswered: [[String:String]] = []
    
    
    // function to provide the total amount of questions for the game
    func triviaCounter() -> Int {
        let triviaCount: Int = trivia.count
        return triviaCount
    }
    
    // Function to determine the index number of the array
    func indexGenerator() -> Int {
        
        let indexOfSelectedQuestion = GKRandomSource.sharedRandom().nextInt(upperBound: trivia.count)
        
        return indexOfSelectedQuestion
    }
    
    // Function to remove from array and add to answered array
    func triviaSorter(indexVariable index: Int) {
        triviaAnswered.append(trivia[index])
        trivia.remove(at: index)
    }
    
    // Function to reset the trivia game, clearing the trivia answered array and putting the answers back into the original array.
    func triviaReset() {
        for i in 0..<triviaAnswered.count {
            let question = triviaAnswered[i]
            trivia.append(question)
            triviaAnswered.remove(at: i)
        }
    }
    
    // Function to determine the question
    func randomTrivia(indexVariable index: Int) -> String {
        let triviaQuestion: String
        triviaQuestion = trivia[index]["Question"]!
        return triviaQuestion
    }
    
    // Function to determine the answer
    func triviaAnswer(indexVariable index: Int) -> String {
        return trivia[index]["Correct Answer"]!
        
    }
    
    // Functions to determine the answer labels
    func questionAnswers1(indexVariable index: Int) -> String {
        return trivia[index]["Option 1"]!
    }
    
    func questionAnswers2(indexVariable index: Int) -> String {
        return trivia[index]["Option 2"]!
    }
    
    func questionAnswers3(indexVariable index: Int) -> String {
        return trivia[index]["Option 3"]!
    }
    
    func questionAnswers4(indexVariable index: Int) -> String {
        return trivia[index]["Option 4"]!
    }
}
