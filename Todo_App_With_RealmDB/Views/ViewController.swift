//
// ViewController.swift
// Todo_App_With_RealmDB

//  Created by Emmanuel Omokagbo on 18/02/2022
//  Copyright © 2022 Emmanuel Omokagbo. All rights reserved.


import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    
    private lazy var table: UITableView = {
        let table = UITableView()
        return table
    }()
    
    private var todos = [Todo]()
    
    // MARK: -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(table)
        setupUI()
    }
    
    // MARK: - Helpers
    
    fileprivate func setupUI() {
        view.addSubview(table)
        table.frame = view.bounds
        table.delegate = self
        table.dataSource = self
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewTodo))
    }
    
    @objc fileprivate func addNewTodo() {
        isAddNewTodo(isAdd: true, index: 0)
    }
    
    fileprivate func isAddNewTodo(isAdd: Bool, index: Int) {
        let alertController = UIAlertController(title: isAdd ? "Add New Todo" : "Update your todo", message: "Please enter your todo details", preferredStyle: .alert)
        
        alertController.addTextField { [weak self] title in
            title.placeholder = isAdd ? "Enter Todo title" : self?.todos[index].title
        }
        
        alertController.addTextField { [weak self] details in
            details.placeholder = isAdd ? "Enter Todo details" : self?.todos[index].details
        }
        
        alertController.addAction(UIAlertAction(title: isAdd ? "Save" : "Update", style: .default, handler: { [weak self] _ in
            if let title = alertController.textFields?.first?.text, let details = alertController.textFields?[1].text {
                let todo = Todo(title: title, details: details)
                if isAdd {
                    self?.todos.insert(todo, at: index)
                } else {
                    self?.todos[index] = todo
                }
                self?.table.reloadData()
            }
        }))
        
        alertController.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: nil))
        
        present(alertController, animated: true)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        todos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        cell.textLabel?.text = todos[indexPath.row].title
        cell.detailTextLabel?.text = todos[indexPath.row].details
        return cell
    }
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        isAddNewTodo(isAdd: false, index: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
         
        let save = UIContextualAction(style: .normal, title: "Edit") { [weak self] _, _, _ in
            self?.isAddNewTodo(isAdd: false, index: indexPath.row)
        }
        save.backgroundColor = .systemGreen
        let delete = UIContextualAction(style: .destructive, title: "Delete") { [weak self] _, _, _ in
            self?.todos.remove(at: indexPath.row)
            self?.table.reloadData()
        }
        
        let swipeActionConfiguration = UISwipeActionsConfiguration(actions: [save, delete])
        return swipeActionConfiguration
    }
    
}

