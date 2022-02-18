//
// LocalDataSource.swift
// Todo_App_With_RealmDB

//  Created by Emmanuel Omokagbo on 18/02/2022
//  Copyright © 2022 Emmanuel Omokagbo. All rights reserved.


import Foundation
import RealmSwift

final class RealmLocalDataSource: IDataSource {
    
    fileprivate let realm: Realm!
    
    init(realm: Realm) {
        self.realm = realm
    }
    
    func saveTodo(todo: Todo) {
        do {
            try realm.write({
                realm.add(todo)
            })
        } catch {
            print(error.localizedDescription)
        }
        
    }
    
    func fetchAllTodos() -> [Todo] {
        return Array(realm.objects(Todo.self))
    }
    
    func editTodo(oldTodo: Todo, newTodo: Todo) {
        do {
            try realm.write {
                oldTodo.title = newTodo.title
                oldTodo.details = newTodo.details
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func deleteTodo(todo: Todo) {
        do {
            try realm.write({
                realm.delete(todo)
            })
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func getDatabaseURL() -> URL? {
        return realm.configuration.fileURL
    }
    
}
