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
    @IBOutlet var singleButtons: [UIButton]!
    
    @IBOutlet var multipleStackView: UIStackView!
    @IBOutlet var multipleLabels: [UILabel]!
    
    
    @IBOutlet var rangeStackView: UIStackView!
    @IBOutlet var progressView: UIProgressView!
    
    var questionIndex = 0
    var questions: [Question]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questions = Question.all
        updateUI()
        
    }
    
    func updateUI() {
        singleStackView.isHidden = true
        multipleStackView.isHidden = true
        rangeStackView.isHidden = true
        
        let currentQuestion = questions[questionIndex]
        let answers = currentQuestion.answers
        let progress = Float(questionIndex) / Float(questions.count)
        
        navigationItem.title = "Вопрос № \(questionIndex + 1) из \(questions.count)"
        questionLabel.text = currentQuestion.text
        progressView.setProgress(progress + 0.2, animated: true)
        
        switch currentQuestion.type {
        case .single:
            updateSingleStack(with: answers)
        case .multiple:
            updateMultipleStack(with: answers)
        case .ranged:
            updateRangedStack(with: answers)
        }
        
    }
    
    func updateSingleStack(with answers: [Answer]) {
        singleStackView.isHidden = false
        for (button, answer) in zip(singleButtons, answers) {
            button.setTitle(answer.text, for: [])
        }
    }
    
    func updateMultipleStack(with answers: [Answer]) {
        multipleStackView.isHidden = false
        for (label, answer) in zip(multipleLabels, answers) {
            label.text = answer.text
        }
    }
    
    func updateRangedStack(with answer: [Answer]) {
        rangeStackView.isHidden = false
    }
    
    func nextQuestion() {
        questionIndex += 1
        
        if questionIndex < questions.count {
            updateUI()
        } else {
            performSegue(withIdentifier: "ResultsSegue", sender: nil)
        }
        
    }
    
    @IBAction func singleButtonPressed(_ sender: UIButton) {
        nextQuestion()
    }
    
    @IBAction func multipleButtonPressed(_ sender: UIButton) {
        nextQuestion()
    }
    
    @IBAction func rangedButtonPressed(_ sender: UIButton) {
        nextQuestion()
    }
    
}
