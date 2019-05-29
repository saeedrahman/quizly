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
    
    
    var score = 0
    
    @IBAction func selectChoiceAction(_ sender: UIButton) {
    
    sender.backgroundColor = UIColor.green
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
}
