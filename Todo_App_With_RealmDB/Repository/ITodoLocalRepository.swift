//
// ITodoLocalRepository.swift
// Todo_App_With_RealmDB

//  Created by Emmanuel Omokagbo on 18/02/2022
//  Copyright © 2022 Emmanuel Omokagbo. All rights reserved.
	

import Foundation

protocol ITodoLocalRepository {
    var dataSource: ILocalDataSource { get set }
    
    func saveTodo(todo: Todo)
    func fetchAllTodos() -> [Todo]
    func editTodo(oldTodo: Todo, newTodo: Todo)
    func deleteTodo(todo: Todo)
    func getDatabaseURL() -> URL?
}
