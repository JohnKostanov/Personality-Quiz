//
//  ResultViewController.swift
//  Personality Quiz
//
//  Created by  Джон Костанов on 30/06/2019.
//  Copyright © 2019 John Kostanov. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet var answerLabel: UILabel!
    @IBOutlet var definitionLabel: UILabel!
    
    var responses: [Answer]!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        updateUI()
    }
    
    func updateUI() {
        let fruitTypes = responses.map { $0.type }
        var fruitCount = [FruitType: Int]()
        fruitTypes.forEach { fruitType in
            fruitCount[fruitType] = (fruitCount[fruitType] ?? 0) + 1
        }
        //print(#line, #function, fruitCount)
        let sortedCount = fruitCount.sorted { $0.value > $1.value }
        let fruit = sortedCount.first!.key
        
        answerLabel.text = "Вам нравится - \(fruit.rawValue)!"
        definitionLabel.text = fruit.definition
    }
    
}
