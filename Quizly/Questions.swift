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
    }
}
