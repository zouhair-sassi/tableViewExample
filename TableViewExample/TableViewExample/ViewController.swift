//
//  ViewController.swift
//  TableViewExample
//
//  Created by Zouhair Sassi on 6/21/19.
//  Copyright © 2019 Zouhair Sassi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var tableView : UITableView?
    var array = [User]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupData()
        self.setupView()
    }

    func setupData() {
        let user1 = User(name: "Alex", age: 54, sex: "M", number: 2222222)
        let user2 = User(name: "Emily", age: 47, sex: "F", number: 11111111)
        let user3 = User(name: "Tony", age: 25, sex: "M", number: 4444444)
        let user4 = User(name: "Alian", age: 26, sex: "M", number: 3333333 )
        let user5 = User(name: "Amanda", age: 48, sex: "F", number: 8656746)
        let user6 = User(name: "Alexis", age: 33, sex: "M", number: 58568548)
        let user7 = User(name: "Amelia", age: 31, sex: "F", number: 45696264)
        let user8 = User(name: "Amy", age: 29, sex: "F", number: 484949949)
        array.append(user1)
        array.append(user2)
        array.append(user3)
        array.append(user4)
        array.append(user5)
        array.append(user6)
        array.append(user7)
        array.append(user8)
    }

    func setupView() {
        let tableView = UITableView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height))
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
    }
}

//MARK: UITableVIew delegate
extension ViewController {

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "List Of Employer"
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "CellID")
        let user = array[indexPath.row]
        cell.textLabel?.text = String(format: "Name: %@,   Age:%lu", user.name, user.age)
        cell.detailTextLabel?.text = String(format: "%lu", user.age)
        if user.sex == "M" {
            cell.imageView?.image = UIImage(named: "male")
        } else {
            cell.imageView?.image = UIImage(named: "female")
        }
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let user = array[indexPath.row]
        let alert = UIAlertController(title: "Alert!", message: String(format: "%llu", user.number), preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(alertAction)
        present(alert, animated: true, completion: nil)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }

    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration?  {
        // Write action code for the trash
        let TrashAction = UIContextualAction(style: .normal, title:  "Trash", handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
            print("Update action ...")
            success(true)
        })
        TrashAction.backgroundColor = .red

        // Write action code for the Flag
        let FlagAction = UIContextualAction(style: .normal, title:  "Flag", handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
            print("Update action ...")
            success(true)
        })
        FlagAction.backgroundColor = .orange

        // Write action code for the More
        let MoreAction = UIContextualAction(style: .normal, title:  "More", handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
            print("Update action ...")
            success(true)
        })
        MoreAction.backgroundColor = .gray


        return UISwipeActionsConfiguration(actions: [TrashAction,FlagAction,MoreAction])
    }

    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {

        let closeAction = UIContextualAction(style: .normal, title:  "Mark as Read", handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
            print("CloseAction ...")
            success(true)
        })
        closeAction.backgroundColor = .blue
        return UISwipeActionsConfiguration(actions: [closeAction])

    }

}
