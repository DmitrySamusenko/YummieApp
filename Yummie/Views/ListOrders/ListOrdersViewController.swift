//
//  ListOrdersViewController.swift
//  Yummie
//
//  Created by Dmitry Samusenko on 16.01.2023.
//

import UIKit

class ListOrdersViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var orders: [Order] = [
        .init(id: "id1", name: "Dmitry Samusenko", dish: .init(id: "id1", name: "Garri", description: "This is the best I have ever tasted", image: "https://picsum.photos/100/200", calories: 304)),
        .init(id: "id2", name: "Violet Yasnova", dish: .init(id: "id2", name: "Garri", description: "This is the best I have ever tasted", image: "https://picsum.photos/100/200", calories: 134)),
        .init(id: "id3", name: "Dmitry Samusenko", dish: .init(id: "id3", name: "Garri", description: "This is the best I have ever tasted", image: "https://picsum.photos/100/200", calories: 1034)),
        .init(id: "id4", name: "Dmitry Samusenko", dish: .init(id: "id4", name: "Garri", description: "This is the best I have ever tasted", image: "https://picsum.photos/100/200", calories: 34)),
        
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Orders"
        registerCells()
    }
    private func registerCells() {
        tableView.register(UINib(nibName: DishListTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: DishListTableViewCell.identifier)
    }
}
extension ListOrdersViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orders.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DishListTableViewCell.identifier, for: indexPath) as! DishListTableViewCell
        cell.setup(order: orders[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = DishDetailViewController.instantiate()
        controller.dish = orders[indexPath.row].dish
        navigationController?.present(controller, animated: true)
    }
    
}
