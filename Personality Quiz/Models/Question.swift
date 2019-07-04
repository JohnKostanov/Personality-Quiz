//
//  Question.swift
//  Personality Quiz
//
//  Created by  Джон Костанов on 02/07/2019.
//  Copyright © 2019 John Kostanov. All rights reserved.
//

struct Question {
    var text: String
    var type: ResponseType
    var answers: [Answer]
    
    /// Все вопросы, ответы и типы ответов
    static var all: [Question] {
        return [
            Question(text: "Что вы покупаете чаще всего?", type: .single, answers: [
                Answer(text: "Бананы", type: .banana),
                Answer(text: "Яблоки", type: .apple),
                Answer(text: "Арбузы", type: .watermelon),
                Answer(text: "Дыни", type: .melon),
                ]),
            Question(text: "Какие фрукты вы покупаете когда приглашаете гостей?", type: .multiple, answers: [
                Answer(text: "Бананы", type: .banana),
                Answer(text: "Яблоки", type: .apple),
                Answer(text: "Арбузы", type: .watermelon),
                Answer(text: "Дыни", type: .melon),
                ]),
            Question(text: "Любите ли вы мюсли?", type: .ranged, answers: [
                Answer(text: "Ненавижу", type: .watermelon),
                Answer(text: "Не очень", type: .melon),
                Answer(text: "Почему бы и нет", type: .apple),
                Answer(text: "Обожаю", type: . banana),
                ]),
            Question(text: "Любите ли вы пить натуральный сок?", type: .ranged, answers: [
                Answer(text: "Ненавижу", type: .watermelon),
                Answer(text: "Не очень", type: .melon),
                Answer(text: "Почему бы и нет", type: .banana),
                Answer(text: "Обожаю", type: .apple),
                ]),
            Question(text: "Какое фото вам больше нравиться?", type: .image, answers: [
                Answer(text: "Девочка с бананами", type: .banana),
                Answer(text: "Девочка с яблоками", type: .apple),
                Answer(text: "Девочка с дыней", type: .melon),
                Answer(text: "Девочка с арбузом", type: .watermelon),
               
                
                ])
        ]
    }
}
