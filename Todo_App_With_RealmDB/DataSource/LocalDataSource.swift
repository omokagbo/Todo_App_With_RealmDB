//
// LocalDataSource.swift
// Todo_App_With_RealmDB

//  Created by Emmanuel Omokagbo on 18/02/2022
//  Copyright © 2022 Emmanuel Omokagbo. All rights reserved.


import Foundation
import RealmSwift

final class LocalDataSource: ILocalDataSource {
    
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
    
    func editTodo(todo: Todo) {
        
    }
    
    func deleteTodo(todo: Todo) {
        
    }
    
    func getDatabaseURL() -> URL? {
        return realm.configuration.fileURL
    }
    
}
