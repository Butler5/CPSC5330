//
//  ViewController.swift
//  MyAdventure
//
//  Created by Adam Butler on 11/12/23.
//

import UIKit

struct Question {
   
    init(_ ques: String, _ o_one:String, _ o_two: String, _ ans: String){
        question = ques
        option_one = o_one
        option_two = o_two
        answer = ans
    }
    
    var question: String
    var answer: String
    var option_one: String
    var option_two: String
    
}

class ViewController: UIViewController {

    
    @IBOutlet weak var app_background: UIImageView!
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var optionOne: UIButton!
    
    @IBOutlet weak var optionTwo: UIButton!
    
    var questionIndex : Int = 0
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    @IBAction func answerSubmitted(_ sender: UIButton) {
         
        let answerSubmitted = sender.titleLabel!.text!
        
        let isCorrect = compareUserAnswer(answerSubmitted)
        
        if isCorrect {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        increaseIndex()
        
        Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
        @objc func updateUI() {
        questionLabel.text = question[questionIndex].question
        app_background.image = UIImage(named: String(questionIndex + 1))
        optionOne.setTitle(question[questionIndex].option_one, for: .normal)
        optionTwo.setTitle(question[questionIndex].option_two, for: .normal)
        optionOne.backgroundColor = UIColor.clear
        optionTwo.backgroundColor = UIColor.clear
    }
    
    func compareUserAnswer(_ response: String) -> Bool{
            if response == question[questionIndex].answer {
                return true
            }   else {
                    return true
            }
    }
    
    func increaseIndex() {
            if questionIndex < question.count - 1 {
                questionIndex += 1
            } else {
                questionIndex = 0
            }
    }
}


