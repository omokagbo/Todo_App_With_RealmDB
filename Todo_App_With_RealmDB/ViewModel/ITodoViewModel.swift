//
// ITodoViewModel.swift
// Todo_App_With_RealmDB

//  Created by Emmanuel Omokagbo on 18/02/2022
//  Copyright © 2022 Emmanuel Omokagbo. All rights reserved.

import Foundation
import RealmSwift

protocol ITodoViewModel {
    var todos: [Todo] { get set }
    var repo: ITodoRepository { get set }
    
    func saveTodo(todo: Todo)
    func fetchAllTodos()
    func deleteTodo(todo: Todo)
    func updateTodo(oldTodo: Todo, newTodo: Todo)
}
