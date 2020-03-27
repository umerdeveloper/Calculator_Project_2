//  ViewController.swift
//  Calculator_Project_2
//  Created by Umer Khan on 26/03/2020.
//  Copyright © 2020 Umer Khan. All rights reserved.

import UIKit

class ViewController: UIViewController {
    
    // MARK: - UI Components
    @IBOutlet weak var tappedButtonsTextView: UITextView!
    @IBOutlet weak var calculatedAnswerTextView: UITextView!
    
    // MARK: - Supporting Properties
    var isDarkMode: Bool = false
    let whiteAppearanceMoonIcon = #imageLiteral(resourceName: "moon")
    let darkAppearanceSunIcon = #imageLiteral(resourceName: "sun")

    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func appearanceButtonTapped(_ sender: UIButton) {
        //TODO: - Change Icon
        isDarkMode = !isDarkMode
        if isDarkMode { sender.setImage(whiteAppearanceMoonIcon, for: .normal) }
        else { sender.setImage(darkAppearanceSunIcon, for: .normal) }
    }
    
    
    @IBAction func calculaterButtons(_ sender: UIButton) {
       
        
    }
}

