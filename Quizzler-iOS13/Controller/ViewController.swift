//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var choice1: UIButton!
    @IBOutlet weak var choice2: UIButton!
    @IBOutlet weak var choice3: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var quizBrain=QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer=sender.currentTitle! //True, False
        let userGotItRight=quizBrain.checkAnswer(userAnswer)
        
        if userGotItRight {
            sender.backgroundColor=UIColor.green
        }else{
            sender.backgroundColor=UIColor.red
        }
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI(){
        questionLabel.text=quizBrain.getQuestionText()
        progressBar.progress=quizBrain.getProgress()
        scoreLabel.text="Score: \(quizBrain.getScore())"
        
        choice1.backgroundColor=UIColor.clear
        choice2.backgroundColor=UIColor.clear
        choice3.backgroundColor=UIColor.clear
        
        choice1.setTitle(quizBrain.getChoiceTitle(1), for: .normal)
        choice2.setTitle(quizBrain.getChoiceTitle(2), for: .normal)
        choice3.setTitle(quizBrain.getChoiceTitle(3), for: .normal)
    }
}

