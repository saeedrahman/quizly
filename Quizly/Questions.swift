//
//  Questions.swift
//  Quizly
//
//  Created by Saeed Rahman on 28/5/2019.
//  Copyright © 2019 Saeed Rahman. All rights reserved.
//

import Foundation

class Questions {
    
    var questions = [Question]()
    
    init() {
        questions.append(Question(questionText: "What is the capital city of the United Kingdom?", choiceOne: "London", choiceTwo: "Manchester", choiceThree: "Sheffield", choiceFour: "Bristol", correctAnswer: 1))
        questions.append(Question(questionText: "How many states are there in the United States?", choiceOne: "51", choiceTwo: "52", choiceThree: "35", choiceFour: "17", correctAnswer: 2))
        questions.append(Question(questionText: "First China War was fought between which countries?", choiceOne: "China and Britain", choiceTwo: "China and France", choiceThree: "China and Egypt", choiceFour: "China and Greece", correctAnswer: 1))
    }
}
