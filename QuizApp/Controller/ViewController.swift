//
//  ViewController.swift
//  QuizApp
//
//  Created by Adnan Sarker on 27/03/2021.
//  Copyright © 2021 Justdreams. All rights reserved.
//
import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var questionText: UILabel!
    @IBOutlet weak var choice2Button: UIButton!
    @IBOutlet weak var choice3Button: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var choice1Button: UIButton!
    
    var quizBrain = QuizBrain()
    
    var rightCount = 0;
    var wrongCount = 0;
    //var progressCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }
    
    @IBAction func ansButton(_ sender: UIButton) {
        
        let userAns = sender.currentTitle!// True or False
        let userGotItRight = quizBrain.checkAns(userAns)
        
        if userGotItRight {
            //print("Right")
            sender.backgroundColor = UIColor.green
            rightCount += 1
        }
        else {
            sender.backgroundColor = UIColor.red
            wrongCount += 1
            //print ("Wrong")
        }
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
        //updateUI()
    }
    
    @objc func updateUI () {

        questionText.text = quizBrain.getQuestion()
        choice1Button.setTitle("\(quizBrain.showAnsOption1())", for: .normal)
        choice2Button.setTitle("\(quizBrain.showAnsOption2())", for: .normal)
        choice3Button.setTitle("\(quizBrain.showAnsOption3())", for: .normal)
        progressBar.progress = quizBrain.getProgress()
        
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        
        choice1Button.backgroundColor = UIColor.clear
        choice2Button.backgroundColor = UIColor.clear
        choice3Button.backgroundColor = UIColor.clear
    }

}

