//
//  QuizViewController.swift
//  Quizly
//
//  Created by Saeed Rahman on 28/5/2019.
//  Copyright © 2019 Saeed Rahman. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {

    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionText: UITextView!
    
    @IBOutlet weak var choiceButtonOne: UIButton!
    @IBOutlet weak var choiceButtonTwo: UIButton!
    @IBOutlet weak var choiceButtonThree: UIButton!
    @IBOutlet weak var choiceButtonFour: UIButton!
    @IBOutlet weak var feedbackLabel: UILabel!
    
    let questionBank = Questions()
    var score = 0
    var questionNumber = 0
    var selectedAnswer = 0
    
    @IBAction func selectChoiceAction(_ sender: UIButton) {
        if sender.tag == selectedAnswer {
            animateFeedbackLabel()
            print("Correct")
        } else {
            print("Incorrect")
        }
        
        generateQuestion()
    }
    
    func animateFeedbackLabel() {
        feedbackLabel.isHidden = false
        feedbackLabel.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        UIView.animate(withDuration: 2.0,
                       delay: 0,
                       usingSpringWithDamping: 0.2,
                       initialSpringVelocity: 6.0,
                       animations: { [weak self] in
                        self?.feedbackLabel.transform = .identity
            },
                       completion: nil)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.feedbackLabel.isHidden = true
        }
    }
    
    func restartQuiz() {
        score = 0
        questionNumber = 0
        generateQuestion()
    }
    
    func generateQuestion() {

        if questionNumber <= questionBank.questions.count - 1 {
        questionText.text = questionBank.questions[questionNumber].questionText.uppercased()
        choiceButtonOne.setTitle(questionBank.questions[questionNumber].choiceOne, for: .normal)
        choiceButtonTwo.setTitle(questionBank.questions[questionNumber].choiceTwo, for: .normal)
        choiceButtonThree.setTitle(questionBank.questions[questionNumber].choiceThree, for: .normal)
        choiceButtonFour.setTitle(questionBank.questions[questionNumber].choiceFour, for: .normal)
        selectedAnswer = questionBank.questions[questionNumber].correctAnswer
        
            questionNumber += 1
            
        } else {
            let alert = UIAlertController(title: "Awesome", message: "End of Quiz. Do you want to start over?", preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "Restart", style: .default, handler: { action in self.restartQuiz()})
            alert.addAction(restartAction)
            present(alert, animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        generateQuestion()
        
        // Do any additional setup after loading the view.
    }
}
