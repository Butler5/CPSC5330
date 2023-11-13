//
//  ViewController.swift
//  MyAdventure
//
//  Created by Adam Butler on 11/12/23.
//

import UIKit



class ViewController: UIViewController {

    
    @IBOutlet weak var app_background: UIImageView!
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var optionOne: UIButton!
    
    @IBOutlet weak var optionTwo: UIButton!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    var quizLogic = QuizLogic()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    @IBAction func answerSubmitted(_ sender: UIButton) {
         
        let answerSubmitted = sender.titleLabel!.text!
        
        let isCorrect = quizLogic.compareUserAnswer(answerSubmitted)
        
        if isCorrect {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        quizLogic.increaseIndex()
        
        Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
        @objc func updateUI() {
            scoreLabel.text = "Score: \(quizLogic.getScore())"
            questionLabel.text = quizLogic.getNextQuestion()
        app_background.image = UIImage(named: String(quizLogic.getImageName()))
        optionOne.setTitle(quizLogic.getChoiceOne(), for: .normal)
        optionTwo.setTitle(quizLogic.getChoiceTwo(), for: .normal)
        optionOne.backgroundColor = UIColor.clear
        optionTwo.backgroundColor = UIColor.clear
    }
    
    
}


