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
        let alertController = UIAlertController(title: isAdd ? "Add New Todo" : "", message: "Please enter your todo details", preferredStyle: .alert)
        
        alertController.addAction(UIAlertAction(title: "Save", style: .default, handler: { [weak self] _ in
            
        }))
        
        alertController.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: nil))
        present(alertController, animated: true)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Hello"
        return cell
    }
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

