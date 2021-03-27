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
    
    let quiz = [
        Questions(text: "hi, im your bro", answer: "True"),
        Questions(text: "hey u r my bro", answer: "False"),
        Questions(text: "its raining", answer: "True")
    ]
    //let size = quiz.count
    var quesNum = 0
    @IBAction func ansButton(_ sender: UIButton) {
        let actualAns = quiz[quesNum].answer
        let userAns = sender.currentTitle!// True or False
        
        if userAns == actualAns {
            print("Right")
        }
        else {
            print ("Wrong")
        }
        quesNum = quesNum + 1
        updateUI()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }
    
    func updateUI () {
        if quesNum > quiz.count - 1 {
            quesNum = 0
        }
        questionText.text = quiz [quesNum].text
        
    }

}

