//
// TodoLocalRepository.swift
// Todo_App_With_RealmDB

//  Created by Emmanuel Omokagbo on 18/02/2022
//  Copyright © 2022 Emmanuel Omokagbo. All rights reserved.


import Foundation

final class TodoLocalRepository: ITodoRepository {
    
    var dataSource: IDataSource
    
    init(dataSource: IDataSource) {
        self.dataSource = dataSource
    }
    
    func saveTodo(todo: Todo) {
        dataSource.saveTodo(todo: todo)
    }
    
    func fetchAllTodos() -> [Todo] {
        return dataSource.fetchAllTodos()
    }
    
    func editTodo(oldTodo: Todo, newTodo: Todo) {
        dataSource.editTodo(oldTodo: oldTodo, newTodo: newTodo)
    }
    
    func deleteTodo(todo: Todo) {
        dataSource.deleteTodo(todo: todo)
    }
    
    func getDatabaseURL() -> URL? {
        return dataSource.getDatabaseURL()
    }
    
    
}
