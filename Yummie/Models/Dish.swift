//
//  Dish.swift
//  Yummie
//
//  Created by Dmitry Samusenko on 07.01.2023.
//

import Foundation

struct Dish {
    let id: String?
    let name: String?
    let description: String?
    let image: String?
    let calories: Int?
    
    var formattedCalories: String {
        return "\(calories ?? 0) calories"
    }
}
