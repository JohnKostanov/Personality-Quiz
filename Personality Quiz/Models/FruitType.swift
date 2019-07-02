//
//  AnimalType.swift
//  Personality Quiz
//
//  Created by  Джон Костанов on 02/07/2019.
//  Copyright © 2019 John Kostanov. All rights reserved.
//

enum FruitType: Character {
    case banana = "🍌"
    case apple = "🍎"
    case watermelon = "🍉"
    case melon = "🍈"
}

//MARK: Definition
extension FruitType {
    var definition: String {
        switch self {
        case .banana:
            return "Так как витамины и микроэлементы, которые в избытке имеются в бананах, помогают усвоению новой информации и улучшают запоминание."
        case .apple:
            return "Переоценить полезные свойства яблока для человека практически невозможно: это настоящая сокровищница витаминов и микроэлементов, баланс которых в организме способствует его омоложению и является основой крепкого иммунитета"
        case .watermelon:
            return "Арбуз содержит богатый комплекс витаминов и микроэлементов. Взрослым и детям полезно включать плод в свой рацион для общего укрепления организма, повышения иммунитета и профилактики авитаминоза"
        case .melon:
            return "Помимо вкусовых качеств дыня обладает массой полезных свойств. Употребляя часто этот продукт, можно обогатить свой организм витаминами, минералами и другими необходимыми, для здоровья нашего организма, веществами"
        }
    }
}