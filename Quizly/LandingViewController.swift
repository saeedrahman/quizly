//
//  ViewController.swift
//  Quizly
//
//  Created by Saeed Rahman on 28/5/2019.
//  Copyright © 2019 Saeed Rahman. All rights reserved.
//

import UIKit

class LandingViewController: UIViewController {

    @IBOutlet weak var quizlyTitle: UILabel!
    @IBOutlet weak var cupImage: UIImageView!
    
    func animateTitle() {
        UIView.animate(withDuration: 1, animations: {
            self.quizlyTitle.frame.origin.y -= 240
        }, completion: nil)
        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
//            self.animateCup()
//        }
    }
    
    func animateCup() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            UIView.animate(withDuration: 1, animations: {
                self.cupImage.alpha = 1.0
            }, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animateTitle()
        animateCup()
    }
    
    override func viewDidAppear(_ animated: Bool) {
    }


}

