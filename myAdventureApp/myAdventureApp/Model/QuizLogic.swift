//
//  QuizLogic.swift
//  myAdventureApp
//
//  Created by Adam Butler on 11/13/23.
//

import Foundation

struct QuizLogic{
    var questionIndex : Int = 0
    var score: Int = 0
    
    let question = [
        Question("What national park will we visit first?",
                 "YellowStone",
                 "Great Smokey Mountains",
                 "Great Smokey Mountains"),
        Question("Which Theme Park will we visit next?",
                 "Walt Disney World",
                 "Universal Studios Florida",
                 "Universal Studios Florida"),
        Question("Finally, what cruise will we set sail on?",
                 "Royal Carribean",
                 "Carnival",
                 "Royal Carribean")
    ]
    
    mutating func compareUserAnswer(_ response: String) -> Bool{
            if response == question[questionIndex].answer {
                score += 1
                return true
            }   else {
                    return true
            }
    }
    
    mutating func increaseIndex() {
            if questionIndex < question.count - 1 {
                questionIndex += 1
            } else {
                questionIndex = 0
                score = 0
            }
    }
    
    func getNextQuestion() -> String {
        return question[questionIndex].question
    }
    
    func getChoiceOne() -> String {
        return question[questionIndex].option_one
    }
    
    func getChoiceTwo() -> String {
        return question[questionIndex].option_two
    }
    
    func getImageName() -> Int {
        return questionIndex + 1
    }
    
    func getScore() -> Int {
        return score
    }
}
