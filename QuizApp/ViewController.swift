//
//  ViewController.swift
//  QuizApp
//
//  Created by Adnan Sarker on 27/03/2021.
//  Copyright © 2021 Justdreams. All rights reserved.
//
import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }
    
    
    @IBOutlet weak var questionText: UILabel!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    
    let quiz = [
        Questions(text: "2 is a Prime Number", answer: "True"),
        Questions(text: "35 is a Prime Number", answer: "False"),
        Questions(text: "13 is a Prime Number", answer: "True"),
        Questions(text: "16th December is Victory day of BD", answer: "True"),
        Questions(text: "Mirpur is Capital Of Dhaka", answer: "True"),
        Questions(text: "Covid-19 is no more as Pandemic", answer: "False"),
        Questions(text: "XOfficer is a Competitive Programmer", answer: "True"),
        Questions(text: "Time is Money, && Money Returns most Precious Time", answer: "True"),
        Questions(text: "Sometimes, Cigar is good for releasing Mental pressure", answer: "True"),
        Questions(text: "its raining", answer: "True")
    ]
    //let size = quiz.count
    var quesNum = 0
    var rightCount = 0;
    var wrongCount = 0;
    //var progressCount = 0
    
    @IBAction func ansButton(_ sender: UIButton) {
        let actualAns = quiz[quesNum].answer
        let userAns = sender.currentTitle!// True or False
        
        if userAns == actualAns {
            //print("Right")
            sender.backgroundColor = UIColor.green
            rightCount += 1
        }
        else {
            sender.backgroundColor = UIColor.red
            wrongCount += 1
            //print ("Wrong")
        }
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
        quesNum = quesNum + 1
        //updateUI()
    }
    
    @objc func updateUI () {
        if quesNum > quiz.count - 1 {
            quesNum = 0
        }
        questionText.text = quiz [quesNum].text
        
        progressBar.progress = Float(quesNum + 1) / Float(quiz.count)
        
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
    }

}

