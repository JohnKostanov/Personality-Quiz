//
//  QuestionViewController.swift
//  Personality Quiz
//
//  Created by  Джон Костанов on 30/06/2019.
//  Copyright © 2019 John Kostanov. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {

    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var singleStackView: UIStackView!
    @IBOutlet var multipleStackView: UIStackView!
    @IBOutlet var rangeStackView: UIStackView!
    @IBOutlet var progressView: UIProgressView!
    
    var currentQuestion = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
        
        

    }
    
    func updateUI() {
        singleStackView.isHidden = true
        multipleStackView.isHidden = true
        rangeStackView.isHidden = true
    }
    
    @IBAction func resultsButtonPressed(_ sender: UIBarButtonItem) {
        updateUI()
        
        switch currentQuestion {
        case 0:
            singleStackView.isHidden = false
        case 1:
            multipleStackView.isHidden = false
        case 2:
            rangeStackView.isHidden = false
        default:
            performSegue(withIdentifier: "ResultsSegue", sender: nil)
        }
        currentQuestion += 1
    }
    
}
