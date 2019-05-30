//
//  QuizViewController.swift
//  Quizly
//
//  Created by Saeed Rahman on 28/5/2019.
//  Copyright © 2019 Saeed Rahman. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {
    
    // Define @IBOutlets for all user interface elements
    
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
    
    // This function checks if the tag of the button that is pressed matches
    // the correct answer. If it's correct, the animation for the feedback
    // label is run (animateFeedbackLabel) and the user interface is updated.
    // The generateQuestion function, generates a new question.
    
    @IBAction func selectChoiceAction(_ sender: UIButton) {
        if sender.tag == selectedAnswer {
            animateFeedbackLabel()
            updateUserInterface()
            print("Correct answer")
        } else {
            print("Incorrect answer")
        }
        
        generateQuestion()
    }
    
    // This function animates the feedbackLabel. To begin with (when the
    // view loads) the label is set to 0 opacity (meaning the label is invisible).
    // When the function runs, the alpha is set to 1.0 (meaning the label is now visible).
    // The first part of the animation uses spring damping for the spring effect. The
    // second part of the animation fades out the label and resets the alpha value to
    // zero.
    
    func animateFeedbackLabel() {
        feedbackLabel.alpha = 1.0
        feedbackLabel.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        UIView.animate(withDuration: 2.0, delay: 0, usingSpringWithDamping: 0.2,
                       initialSpringVelocity: 6.0,
                       animations: { [weak self] in
                        self?.feedbackLabel.transform = .identity
            }, completion: nil)
        
        UIView.animate(withDuration: 0.5, delay: 0.5, options: .curveEaseOut, animations: {
            self.feedbackLabel.alpha = 0.0
        }, completion: nil)
    }
    
    // This function updates the user interface. This includes increasing the score
    // by 1 and updating the label with the correct value. This function is run when the
    // answer is evaluated as correct (see selectChoiceAction function above).
    
    func updateUserInterface() {

    }
    
    // This function restarts the quiz. The score is reset to 0 and the question number is
    // set to the first one in the array (array elements start at 0). The scoreLabel is updated
    // with the new value of score, and the generateQuestion is called to generate a new question.
    
    func restartQuiz() {
        score = 0
        questionNumber = 0
        scoreLabel.text = "\(score)"
        generateQuestion()
    }
    
    // This function generates a new question. The first part of the conditional statement checks
    // to see if the current question is less than or equal to one less than the total number of
    // questions in the array. If it is, a question is generated, buttons are populated with the
    // answers and the correct answer value is assigned to the selectedAnswer variable. Towards
    // the end of the first condition, the questionNumber variable is incremented by 1. The second
    // part of the condition (else) loads an alert if all the questions have already been loaded
    // allowing the user to restart the game.
    
    func generateQuestion() {
        if questionNumber <= questionBank.questions.count - 1 {
            questionText.text = questionBank.questions[questionNumber].questionText
            choiceButtonOne.setTitle(questionBank.questions[questionNumber].choiceOne, for: .normal)
            choiceButtonTwo.setTitle(questionBank.questions[questionNumber].choiceTwo, for: .normal)
            choiceButtonThree.setTitle(questionBank.questions[questionNumber].choiceThree, for: .normal)
            choiceButtonFour.setTitle(questionBank.questions[questionNumber].choiceFour, for: .normal)
            selectedAnswer = questionBank.questions[questionNumber].correctAnswer
            
            questionNumber += 1
            
        } else {
            let alert = UIAlertController(title: "End of Quiz", message: "Do you want to restart?", preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "Restart", style: .default, handler: { action in self.restartQuiz()})
            alert.addAction(restartAction)
            present(alert, animated: true, completion: nil)
        }
    }
    
    // This function runs first when the view loads. Any function that is called within here
    // will run at startup. We are calling the generateQuestion function to generate a new
    // question when the app loads.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        generateQuestion()
    }
}
