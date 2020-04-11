//
//  SettingsViewController.swift
//  AppOfThrones
//
//  Created by Fernando Torcelly Garcia on 09/02/2020.
//  Copyright © 2020 Fernando Torcelly Garcia. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var userField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    @IBAction func cleanRatingAction(_ sender: Any) {
        DataController.shared.cleanRating()
        
        let noteName = Notification.Name(rawValue: "DidRatingsUpdated")
        
        NotificationCenter.default.post(name: noteName, object: nil)

    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }

    // MARK: - Setup
    
    func setupUI() {
        self.title = "Settings"
    }
    
    func validate(username: String) throws {
        guard username.count > 3 else {
            throw ValidatorError.tooShort
        }
        guard username.count < 15 else {
            throw ValidatorError.tooLong
        }
        for character in username {
            guard character.isLetter else {
                throw ValidatorError.invalidCharacterFound(character)
            }
        }
    }
    
    @IBAction func hideKeyboard(_ sender: Any) {
        self.view.endEditing(true)
    }
    
    @IBAction func validate(_ sender: Any) {
        if let username = userField.text {
            do {
                try validate(username: username)
            } catch {
                errorLabel.text = error.localizedDescription
            }
        }
    }
}
