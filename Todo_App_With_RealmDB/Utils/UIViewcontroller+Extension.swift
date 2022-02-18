//
// UIViewcontroller+Extension.swift
// Todo_App_With_RealmDB

//  Created by Emmanuel Omokagbo on 18/02/2022
//  Copyright © 2022 Emmanuel Omokagbo. All rights reserved.
	

import UIKit

extension UIViewController {
    var identifier: String {
        return String(describing: self)
    }
    
    func presentDialog(title: String? = nil, details: String? = nil, buttonTitle: String? = nil, completion: (() -> Void)? = nil) {
        guard let controller = UIStoryboard(name: AppConstants.dialogStoryboard, bundle: nil).instantiateViewController(withIdentifier: AppConstants.dialogViewController) as? DialogViewController else {
            return
        }
        
        controller.dialogTitle = title
        controller.dialogDetails = details
        controller.actionButtonTitle = buttonTitle
        controller.actionButtonCompletion = {
            completion?()
        }
        
        controller.modalPresentationStyle = .fullScreen
        present(controller, animated: true)
    }
}
