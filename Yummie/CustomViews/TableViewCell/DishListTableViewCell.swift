//
//  DishListTableViewCell.swift
//  Yummie
//
//  Created by Dmitry Samusenko on 12.01.2023.
//

import UIKit

class DishListTableViewCell: UITableViewCell {
    static let identifier = "DishListTableViewCell"
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var descriptionLbl: UILabel!

    func setup(dish: Dish) {
        dishImageView.kf.setImage(with: dish.image?.asUrl)
        titleLbl.text = dish.name
        descriptionLbl.text = dish.description
    }
    func setup(order: Order) {
        dishImageView.kf.setImage(with: order.dish?.image?.asUrl)
        titleLbl.text = order.dish?.name
        descriptionLbl.text = order.name
    }
    
}
