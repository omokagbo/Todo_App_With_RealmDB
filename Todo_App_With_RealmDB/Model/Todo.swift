//
// Todo.swift
// Todo_App_With_RealmDB

//  Created by Emmanuel Omokagbo on 18/02/2022
//  Copyright © 2022 Emmanuel Omokagbo. All rights reserved.
	

import Foundation
import RealmSwift

class Todo: Object {
    @Persisted var title: String
    @Persisted var details: String
    
    convenience init(title: String, details: String) {
        self.init()
        self.title = title
        self.details = details
    }
}
