//
// DependencyProvider.swift
// Todo_App_With_RealmDB

//  Created by Emmanuel Omokagbo on 18/02/2022
//  Copyright © 2022 Emmanuel Omokagbo. All rights reserved.


import Foundation
import RealmSwift

struct DependencyProvider {
    static var todos = [Todo]()
    static var realm = try! Realm()
    
    static var dataSource: ILocalDataSource {
        return LocalDataSource(realm: realm)
    }
    
    static var repo: ITodoLocalRepository {
        return TodoLocalRepository(dataSource: self.dataSource)
    }
    
    static var todoViewModel: ITodoViewModel {
        return TodoViewModel(todos: self.todos, repo: self.repo)
    }
    
    static var rootViewController: RootViewController {
        let vc = RootViewController()
        vc.todoViewModel = self.todoViewModel
        return vc
    }
}
