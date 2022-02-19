//
// Coordinators.swift
// Todo_App_With_RealmDB

//  Created by Emmanuel Omokagbo on 18/02/2022
//  Copyright © 2022 Emmanuel Omokagbo. All rights reserved.
	

import UIKit

final class AppCoordinator {
    
    // MARK: - Properties
    
    private let navigationController = UINavigationController()
    
    var rootViewController: UINavigationController {
        return navigationController
    }
    
    // MARK: - Methods
    
    func start() {
        showTodos()
    }
    
    fileprivate func showTodos() {
        let controller = AppDependencyProvider.rootViewController
        navigationController.pushViewController(controller, animated: true)
    }
    
}
