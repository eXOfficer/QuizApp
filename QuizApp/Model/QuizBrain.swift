//
//  QuizBrain.swift
//  QuizApp
//
//  Created by Adnan Sarker on 28/03/2021.
//  Copyright © 2021 Justdreams. All rights reserved.
//

import Foundation

struct QuizBrain {
    let quiz = [
        Questions(text: "2 is a Prime Number", answer: "True"),
        Questions(text: "35 is a Prime Number", answer: "False"),
        Questions(text: "13 is a Prime Number", answer: "True"),
        Questions(text: "16th December is Victory day of BD", answer: "True"),
        Questions(text: "Mirpur is Capital Of Dhaka", answer: "True"),
        Questions(text: "Covid-19 is no more as Pandemic", answer: "False"),
        Questions(text: "eXOfficer is a Competitive Programmer", answer: "True"),
        Questions(text: "Time is Money, && Money Returns- most Precious Time", answer: "True"),
        Questions(text: "Sometimes, Cigar is good for releasing Mental pressure", answer: "True"),
        Questions(text: "its raining", answer: "True")
    ]
    //let size = quiz.count
    var quesNum = 0
    var score = 0
    
    mutating func checkAns (_ userAns: String) -> Bool {
        if userAns == quiz[quesNum].answer {
            score += 1
            return true
        }
        else {
            return false
        }
    }
    
    func getQuestion () -> String {
        return quiz[quesNum].text
    }
    
    
    mutating func nextQuestion () {
        if quesNum + 1 < quiz.count {
            quesNum += 1
        }
        else {
            quesNum = 0
            score = 0
        }
    }
    
    func getProgress () -> Float {
        return Float(quesNum + 1) / Float(quiz.count)
    }
    
    func getScore() -> Int {
        return score
        
    }
}
