//
//  HomeViewController.swift
//  Yummie
//
//  Created by Dmitry Samusenko on 01.01.2023.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var popularCollectionView: UICollectionView!
    @IBOutlet weak var dishLandscapeCollectionView: UICollectionView!
    
    var categories: [DishCategory] = [
        .init(id: "id1", name: "Africa Dish", image: "https://picsum.photos/100/200"),
        .init(id: "id2", name: "Africa Dish 2", image: "https://picsum.photos/100/200"),
        .init(id: "id3", name: "Africa Dish 3", image: "https://picsum.photos/100/200"),
        .init(id: "id4", name: "Africa Dish 4", image: "https://picsum.photos/100/200"),
        .init(id: "id5", name: "Africa Dish 5", image: "https://picsum.photos/100/200")
    ]
    
    var populars: [Dish] = [
        .init(id: "id1", name: "Garri", description: "This is the best I have ever tasted", image: "https://picsum.photos/100/200", calories: 34),
        .init(id: "id1", name: "Indomie", description: "This is the best I have ever tasted", image: "https://picsum.photos/100/200", calories: 35),
        .init(id: "id1", name: "Pizza", description: "This is the best I have ever tasted", image: "https://picsum.photos/100/200", calories: 36),
        .init(id: "id1", name: "Chicken", description: "This is the best I have ever tasted", image: "https://picsum.photos/100/200", calories: 1005),
    ]
    var specials: [Dish] = [
        .init(id: "id1", name: "Fried Frie", description: "This is the best I have ever tasted", image: "https://picsum.photos/100/200", calories: 34),
        .init(id: "id1", name: "Burger California", description: "This is the best I have ever tasted", image: "https://picsum.photos/100/200", calories: 35),
        .init(id: "id1", name: "Bean Sexy", description: "This is the best I have ever tasted", image: "https://picsum.photos/100/200", calories: 36),
        .init(id: "id1", name: "Milky Girl", description: "This is the best I have ever tasted", image: "https://picsum.photos/100/200", calories: 37),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Yummie"
        registerNibs()
    }
    
    private func registerNibs() {
        categoryCollectionView.register(UINib(nibName: CategoryCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        popularCollectionView.register(UINib(nibName: DishPortraitCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: DishPortraitCollectionViewCell.identifier)
        dishLandscapeCollectionView.register(UINib(nibName: DishLanscapeCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: DishLanscapeCollectionViewCell.identifier)
    }

}
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case categoryCollectionView: return categories.count
        case popularCollectionView: return populars.count
        case dishLandscapeCollectionView: return specials.count
        default: return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case categoryCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as! CategoryCollectionViewCell
            cell.setup(category: categories[indexPath.row])
            return cell
        case popularCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DishPortraitCollectionViewCell.identifier, for: indexPath) as! DishPortraitCollectionViewCell
            cell.setup(dish: populars[indexPath.row])
            return cell
        case dishLandscapeCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DishLanscapeCollectionViewCell.identifier, for: indexPath) as! DishLanscapeCollectionViewCell
            cell.setup(dish: specials[indexPath.row])
            return cell
        default: return UICollectionViewCell()
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == categoryCollectionView {
            
        } else {
            let controller = DishDetailViewController.instantiate()
            controller.dish = collectionView == popularCollectionView ? populars[indexPath.row] : specials[indexPath.row]
            navigationController?.present(controller, animated: true)
        }
    }
    
    
}
