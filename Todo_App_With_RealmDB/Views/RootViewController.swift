//
// ViewController.swift
// Todo_App_With_RealmDB

//  Created by Emmanuel Omokagbo on 18/02/2022
//  Copyright © 2022 Emmanuel Omokagbo. All rights reserved.


import UIKit

final class RootViewController: UIViewController {
    
    // MARK: - Properties
    
    var todoViewModel: ITodoViewModel!
    
    private lazy var table: UITableView = {
        let table = UITableView()
        return table
    }()
    
    private lazy var noTodosLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "No Todos yet!"
        lbl.textAlignment = .center
        lbl.font = UIFont(name: "Avenir", size: 20)
        return lbl
    }()
    
    // MARK:
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(table)
        setupUI()
//        debugPrint(todoViewModel.repo.getDatabaseURL() ?? "Could not get location of database")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        todoViewModel.fetchAllTodos()
        table.reloadData()
    }
    
    // MARK: - Helpers
    
    fileprivate func setupUI() {
        title = "Todos"
        
        view.addSubview(table)
        table.frame = view.bounds
        table.delegate = self
        table.dataSource = self
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        view.addSubview(noTodosLabel)
        noTodosLabel.frame = CGRect(x: 0, y: 0, width: 200, height: 30)
        noTodosLabel.center = view.center
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewTodo))
        
        todoViewModel.fetchAllTodos()
    }
    
    @objc fileprivate func addNewTodo() {
        isAddNewTodo(isAdd: true, index: 0)
    }
    
    /// Add a new todo  or update the details of an existing todo Item
    /// - Parameters:
    ///   - isAdd: value to show if it is a new todo item or an update to an existing todo item. If it is true, it is a new todo item else it is updating an existing todo item
    ///   - index: index of the todo item
    fileprivate func isAddNewTodo(isAdd: Bool, index: Int) {
        let alertController = UIAlertController(title: isAdd ? "Add New Todo" : "Update your todo", message: isAdd ? "Please, enter your todo details" : "Please, update your todo details", preferredStyle: .alert)
        
        alertController.addTextField { [weak self] title in
            title.placeholder = isAdd ? "Enter Todo title" : self?.todoViewModel.todos[index].title
        }
        
        alertController.addTextField { [weak self] details in
            details.placeholder = isAdd ? "Enter Todo details" : self?.todoViewModel.todos[index].details
        }
        
        alertController.addAction(UIAlertAction(title: isAdd ? "Save" : "Update", style: .default, handler: { [weak self] _ in
            if let title = alertController.textFields?.first?.text, !title.isEmpty, title.count > 2, let details = alertController.textFields?[1].text, !details.isEmpty, details.count > 2 {
                let todo = Todo(title: title, details: details)
                if isAdd {
                    self?.todoViewModel.todos.insert(todo, at: index)
                    self?.todoViewModel.saveTodo(todo: todo)
                } else {
                    self?.todoViewModel.updateTodo(oldTodo: (self?.todoViewModel.todos[index])!, newTodo: todo)
                }
                self?.table.reloadData()
            } else {
                self?.presentDialog(title: "Invalid Entries!", details: "Please, ensure to enter in the title and details of your todo.", buttonTitle: "OK", completion: {
                    self?.dismiss(animated: true, completion: {
                        self?.present(alertController, animated: true)
                    })
                })
            }
        }))
        
        alertController.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: nil))
        
        present(alertController, animated: true)
    }
    
    fileprivate func hideNoTodoLabel() {
        if todoViewModel.todos.count > 0 {
            noTodosLabel.isHidden = true
        } else {
            noTodosLabel.isHidden = false
        }
    }
    
}

// MARK: - UITableView Extensions

extension RootViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        hideNoTodoLabel()
        return todoViewModel.todos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        cell.textLabel?.text = todoViewModel.todos[indexPath.row].title
        cell.textLabel?.font = UIFont(name: "Avenir", size: 20)
        cell.detailTextLabel?.text = todoViewModel.todos[indexPath.row].details
        cell.detailTextLabel?.font = UIFont(name: "Avenir", size: 14)
        return cell
    }
    
}

extension RootViewController: UITableViewDelegate {
    
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
            if let todo = self?.todoViewModel.todos[indexPath.row] {
                self?.todoViewModel.deleteTodo(todo: todo)
            }
            self?.todoViewModel.todos.remove(at: indexPath.row)
            self?.table.reloadData()
        }
        
        let swipeActionConfiguration = UISwipeActionsConfiguration(actions: [save, delete])
        return swipeActionConfiguration
    }
    
}

