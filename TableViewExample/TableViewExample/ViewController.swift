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
    var array = ["Alex", "Emily", "Tony", "Alian", "Alexis", "Ronaldo", "jack"]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
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
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .value1, reuseIdentifier: "CellID")
        cell.textLabel?.text = array[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let alert = UIAlertController(title: "Alert!", message: "\(indexPath)", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(alertAction)
        present(alert, animated: true, completion: nil)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
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
