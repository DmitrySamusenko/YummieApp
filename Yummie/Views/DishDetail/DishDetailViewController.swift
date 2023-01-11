//
//  DishDetailViewController.swift
//  Yummie
//
//  Created by Dmitry Samusenko on 11.01.2023.
//

import UIKit

class DishDetailViewController: UIViewController {
    
    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var caloriesLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var nameField: UITextField!
    var dish: Dish!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        popularView()
        
    }
    private func popularView() {
        dishImageView.kf.setImage(with: dish.image?.asUrl)
        titleLbl.text = dish.name
        caloriesLbl.text = dish.formattedCalories
        descriptionLbl.text = dish.description
    }
    @IBAction func placeOrderBtnClicked(_ sender: UIButton) {
    }
    
}
