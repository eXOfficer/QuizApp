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
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var scoreLabel: UILabel!
    
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
        progressBar.progress = quizBrain.getProgress()
        
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
    }

}

