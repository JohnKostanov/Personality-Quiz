//
//  QuestionViewController.swift
//  Personality Quiz
//
//  Created by  Джон Костанов on 30/06/2019.
//  Copyright © 2019 John Kostanov. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var singleStackView: UIStackView!
    @IBOutlet var singleButtons: [UIButton]!
    
    @IBOutlet var multipleStackView: UIStackView!
    @IBOutlet var multipleLabels: [UILabel]!
    
    @IBOutlet var rangeStackView: UIStackView!
    @IBOutlet var rangedSlider: UISlider!
    @IBOutlet var rangedLabels: [UILabel]!
    
    @IBOutlet var progressView: UIProgressView!
    
    // MARK: - Properties
    /// Массив ответов, который выбрал пользователь
    var answerChosen = [Answer]()
    /// Текущий индекс вопроса
    var questionIndex = 0
    /// Массив всех вопросов
    var questions: [Question]!
    /// Содержит текущий вопрос
    var currentQuestion: Question {
        return questions[questionIndex]
    }
    /// Содержит текущий ответ
    var currentAnswers: [Answer] {
        return currentQuestion.answers
    }
    
    // MARK: - UIViewController Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        questions = Question.all
        updateUI()
        
    }
    
    // MARK: - Custom Methods
    /// Переключает StackView и обновлеят текст вопроса и progressView
    func updateUI() {
        singleStackView.isHidden = true
        multipleStackView.isHidden = true
        rangeStackView.isHidden = true
        
       let progress = Float(questionIndex) / Float(questions.count)
        
        navigationItem.title = "Вопрос № \(questionIndex + 1) из \(questions.count)"
        questionLabel.text = currentQuestion.text
        progressView.setProgress(progress + 0.2, animated: true)
        
        switch currentQuestion.type {
        case .single:
            updateSingleStack(with: currentAnswers)
        case .multiple:
            updateMultipleStack(with: currentAnswers)
        case .ranged:
            updateRangedStack(with: currentAnswers)
        }
        
    }
    
    /// Включает SingleStack и заполняет текст ответов
    ///
    /// - Parameter answers: Массив ответов [Аnswer]
    func updateSingleStack(with answers: [Answer]) {
        singleStackView.isHidden = false
        for (button, answer) in zip(singleButtons, answers) {
            button.setTitle(answer.text, for: [])
        }
    }
    
    /// Включает MultiStack и заполняет текст ответов
    ///
    /// - Parameter answers: Массив ответов [Аnswer]
    func updateMultipleStack(with answers: [Answer]) {
        multipleStackView.isHidden = false
        for (label, answer) in zip(multipleLabels, answers) {
            label.text = answer.text
        }
    }
    
    /// Включает RangedStack и заполняет текст rangedLabels
    ///
    /// - Parameter answers: Массив ответов [Аnswer]
    func updateRangedStack(with answers: [Answer]) {
        rangedLabels.first?.text = answers.first?.text
        rangedLabels.last?.text = answers.last?.text
        rangeStackView.isHidden = false
    }
    
    /// Увеличивает индекс вопроса на 1 и переходит на следующий вопрос либо на экран результата
    func nextQuestion() {
        //print(#line, #function, answerChosen, "\n")
        questionIndex += 1
        
        if questionIndex < questions.count {
            updateUI()
        } else {
            performSegue(withIdentifier: "ResultsSegue", sender: nil)
        }
        
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "ResultsSegue" else { return }
        let destination = segue.destination as! ResultViewController
        destination.responses = answerChosen
    }
    
    // MARK: - Actions
    /// Добавляет ответ, который выбрал пользователь в массив выбранных ответов пользователя - answerChosen и переходит к следующему вопросу
    ///
    /// - Parameter sender: Кнопка ответить
    @IBAction func singleButtonPressed(_ sender: UIButton) {
        guard let answerIndex = singleButtons.firstIndex(of: sender) else { return }
        let answer = currentAnswers[answerIndex]
        answerChosen.append(answer)
        
        nextQuestion()
    }
    
    /// Добавляет ответ, который выбрал пользователь в массив выбранных ответов пользователя - answerChosen и переходит к следующему вопросу
    ///
    /// - Parameter sender: Кнопка ответить
    @IBAction func multipleButtonPressed(_ sender: UIButton) {
        for (index, view) in multipleStackView.arrangedSubviews.enumerated() {
            guard let stackView = view as? UIStackView else { continue }
            guard let switchView = stackView.arrangedSubviews.last as? UISwitch else { continue }
            if switchView.isOn {
                let answer = currentAnswers[index]
                answerChosen.append(answer)
            }
        }
        
        nextQuestion()
    }
    
    /// Добавляет ответ, который выбрал пользователь в массив выбранных ответов пользователя - answerChosen и переходит к следующему вопросу
    ///
    /// - Parameter sender: Кнопка ответить
    @IBAction func rangedButtonPressed(_ sender: UIButton) {
        let index = Int(round(rangedSlider.value * Float(currentAnswers.count - 1)))
        let answer = currentAnswers[index]
        answerChosen.append(answer)
        
        nextQuestion()
    }
    
}
