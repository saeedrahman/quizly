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
    
    func generateQuestions() {
        
        questions.append(Question(image: "imageOne", choiceOne: "Choice 1", choiceTwo: "Choice 2", choiceThree: "Choice 3", choiceFour: "Choice 4", correctAnswer: 3))
    }
    
}
