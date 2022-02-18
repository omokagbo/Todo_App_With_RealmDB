//
// DependencyProvider.swift
// Todo_App_With_RealmDB

//  Created by Emmanuel Omokagbo on 18/02/2022
//  Copyright © 2022 Emmanuel Omokagbo. All rights reserved.
	

import Foundation

struct DependencyProvider {
    static var todos = [Todo]()
    
    static var todoViewModel: ITodoViewModel {
        return TodoViewModel(todos: self.todos)
    }
    
    static var viewController: RootViewController {
        let vc = RootViewController()
        vc.todoViewModel = todoViewModel
        return vc
    }
}
