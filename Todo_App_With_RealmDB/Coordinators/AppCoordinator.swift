//
// Coordinators.swift
// Todo_App_With_RealmDB

//  Created by Emmanuel Omokagbo on 18/02/2022
//  Copyright © 2022 Emmanuel Omokagbo. All rights reserved.
	

import UIKit

final class AppCoordinator {
    
    private let navigationController = UINavigationController()
    
    var rootViewController: UINavigationController {
        return navigationController
    }
    
    func start() {
        let controller = AppDependencyProvider.rootViewController
        navigationController.pushViewController(controller, animated: true)
    }
    
}
