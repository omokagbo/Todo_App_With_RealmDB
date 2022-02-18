//
// DialogViewController.swift
// Todo_App_With_RealmDB

//  Created by Emmanuel Omokagbo on 18/02/2022
//  Copyright © 2022 Emmanuel Omokagbo. All rights reserved.


import UIKit

class DialogViewController: UIViewController {
    
    // MARK: - Properties
    
    var dialogTitle: String?
    var dialogDetails: String?
    var actionButtonTitle: String?
    var actionButtonCompletion: (() -> Void)?
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var dialogTitleLabel: UILabel!
    @IBOutlet weak var dialogDetailsLabel: UILabel!
    @IBOutlet weak var actionButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    // MARK: -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.dismiss(animated: true)
    }
    
    // MARK: - IBActions
    
    @IBAction func actionButtonTapped(_ sender: UIButton) {
        actionButtonCompletion?() ?? self.dismiss(animated: true)
    }
    
    @IBAction func cancelButtonTapped(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    // MARK: - Helpers
    
    fileprivate func setupUI() {
        dialogTitleLabel.text = dialogTitle ?? "Alert"
        dialogDetailsLabel.text = dialogDetails ?? ""
        actionButton.setTitle(actionButtonTitle ?? "Done", for: .normal)
    }
}
