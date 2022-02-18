//
// TodoViewModel.swift
// Todo_App_With_RealmDB

//  Created by Emmanuel Omokagbo on 18/02/2022
//  Copyright © 2022 Emmanuel Omokagbo. All rights reserved.
	

import Foundation
import RealmSwift

final class TodoViewModel: ITodoViewModel {
    
    var todos: [Todo]
    var dataSource: ILocalDataSource
    
    init(todos: [Todo], dataSource: ILocalDataSource) {
        self.todos = todos
        self.dataSource = dataSource
    }
    
    func saveTodo(todo: Todo) {
        dataSource.saveTodo(todo: todo)
    }
    
    func fetchAllTodos(){
        self.todos = dataSource.fetchAllTodos()
    }
    
    func deleteTodo(todo: Todo) {
        
    }
    
    func updateTodo(todo: Todo) {
        
    }
}
