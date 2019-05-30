//
//  Question.swift
//  Quizly
//
//  Created by Saeed Rahman on 28/5/2019.
//  Copyright © 2019 Saeed Rahman. All rights reserved.
//
//  This class defines the structure for all questions

import Foundation

class Question {
    
    let questionText: String
    let choiceOne: String
    let choiceTwo: String
    let choiceThree: String
    let choiceFour: String
    let correctAnswer: Int
    
    init(questionText: String, choiceOne: String, choiceTwo: String, choiceThree: String, choiceFour: String, correctAnswer: Int) {
        
        self.questionText = questionText
        self.choiceOne = choiceOne
        self.choiceTwo = choiceTwo
        self.choiceThree = choiceThree
        self.choiceFour = choiceFour
        self.correctAnswer = correctAnswer
    }
}
