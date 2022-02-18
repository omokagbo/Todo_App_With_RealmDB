//
// TodoViewModel.swift
// Todo_App_With_RealmDB

//  Created by Emmanuel Omokagbo on 18/02/2022
//  Copyright © 2022 Emmanuel Omokagbo. All rights reserved.
	

import Foundation
import RealmSwift

final class TodoViewModel: ITodoViewModel {
    
    var todos: [Todo]
    var repo: ITodoLocalRepository
    
    init(todos: [Todo], repo: ITodoLocalRepository) {
        self.todos = todos
        self.repo = repo
    }
    
    func saveTodo(todo: Todo) {
        repo.saveTodo(todo: todo)
    }
    
    func fetchAllTodos(){
        self.todos = repo.fetchAllTodos()
    }
    
    func deleteTodo(todo: Todo) {
        repo.deleteTodo(todo: todo)
    }
    
    func updateTodo(oldTodo: Todo, newTodo: Todo) {
        repo.editTodo(oldTodo: oldTodo, newTodo: newTodo)
    }
}
