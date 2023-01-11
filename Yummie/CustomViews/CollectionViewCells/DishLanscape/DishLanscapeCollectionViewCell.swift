//
//  DishLanscapeCollectionViewCell.swift
//  Yummie
//
//  Created by Dmitry Samusenko on 09.01.2023.
//

import UIKit

class DishLanscapeCollectionViewCell: UICollectionViewCell {
    static let identifier = String(describing: DishLanscapeCollectionViewCell.self)
    @IBOutlet weak var caloriesLbl: UILabel!
    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var titleLbl: UILabel!
    
    func setup(dish: Dish) {
        dishImageView.kf.setImage(with: dish.image?.asUrl)
        titleLbl.text = dish.name
        descriptionLbl.text = dish.description
        caloriesLbl.text = dish.formattedCalories
    }

}
