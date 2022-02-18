//
// TodoViewModel.swift
// Todo_App_With_RealmDB

//  Created by Emmanuel Omokagbo on 18/02/2022
//  Copyright © 2022 Emmanuel Omokagbo. All rights reserved.
	

import Foundation

final class TodoViewModel: ITodoViewModel {
    var todos: [Todo]
    
    init(todos: [Todo]) {
        self.todos = todos
    }
}
