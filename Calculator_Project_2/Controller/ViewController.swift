//  ViewController.swift
//  Calculator_Project_2
//  Created by Umer Khan on 26/03/2020.
//  Copyright © 2020 Umer Khan. All rights reserved.

// appearance button tag is 19

import UIKit

class ViewController: UIViewController {
    
    // MARK: - UI Components
    @IBOutlet weak var tappedButtonsTextView: UITextView!
    @IBOutlet weak var calculatedAnswerTextView: UITextView!
    @IBOutlet var allButtons: [UIButton]!
    
    // MARK: - Logic Supporting Properties
    var numberOnScreen: Double = 0.0
    var previousNumber: Double = 0
    var operation: Double = 0.0
    var isPerfromingOperation: Bool = false
    
    // MARK: - UI Supporting Properties
    var isDarkMode: Bool = false
    let whiteAppearanceMoonIcon = #imageLiteral(resourceName: "moon")
    let darkAppearanceSunIcon = #imageLiteral(resourceName: "sun")

    //MARK: - App Appearance
    @IBAction func appearanceButtonTapped(_ sender: UIButton) {
        isDarkMode = !isDarkMode
        if !isDarkMode && sender.tag == 19 {
            sender.setImage(whiteAppearanceMoonIcon, for: .normal)
            colorsForLightMode()
        }
        else if isDarkMode && sender.tag == 19 {
            sender.setImage(darkAppearanceSunIcon, for: .normal)
            colorsForDarkMode()
        }
    }
    
    // MARK: - Numbers Action
    @IBAction func numbersTapped(_ sender: UIButton) {
        
    }
    // MARK: - Operations Action
    @IBAction func operationsButtonsTapped(_ sender: UIButton) {
        if sender.tag == 10 { // Clear Button
            calculatedAnswerTextView.text = ""
            tappedButtonsTextView.text = ""
        }
        
    }
    
}


extension ViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    // TODO: - LightMode
    func colorsForLightMode() {
        
        UIApplication.shared.statusBarStyle = .default
        view.backgroundColor = .white
        
        calculatedAnswerTextView.textColor = UIColor(named: "output_text_color")
        calculatedAnswerTextView.backgroundColor = .white
        
        tappedButtonsTextView.textColor = UIColor(named: "tappedtext_color")
        tappedButtonsTextView.backgroundColor = .white
        
        for button in allButtons {
            switch button.tag {
                case 0...9:
                    button.backgroundColor = UIColor(named: "whiteBG_numbuttons_color")
                    button.titleLabel?.textColor = UIColor(named: "output_text_color")
                case 10...16:
                    button.backgroundColor = UIColor(named: "whiteBG_opbuttons_green")
                    button.titleLabel?.textColor = UIColor(named: "whiteBG_opbuttons_text_color")
                case 17:
                    button.backgroundColor = UIColor(named: "whiteGB_equal_red")
                    button.titleLabel?.textColor = UIColor(named: "whiteBG_equal_text_color")
                case 18:
                    button.backgroundColor = UIColor(named: "whiteBG_numbuttons_color")
                    button.titleLabel?.textColor = UIColor(named: "output_text_color")
                default:
                    button.backgroundColor = .black
                    button.titleLabel?.textColor = .white
            }
        }
    }
    // TODO: - DarkMode
    func colorsForDarkMode() {
        
        UIApplication.shared.statusBarStyle = .lightContent
        view.backgroundColor = .black
        
        calculatedAnswerTextView.backgroundColor = .black
        calculatedAnswerTextView.textColor = .white
        
        tappedButtonsTextView.backgroundColor = .black
        tappedButtonsTextView.textColor = UIColor(named: "blackBG_tapped_text_color")
        
        for button in allButtons {
            switch button.tag {
                case 0...9:
                    button.backgroundColor = .black
                    button.titleLabel?.textColor = UIColor(named: "blackBG_tapped_text_color")
                case 10...16:
                    button.backgroundColor = UIColor(named: "blackBG_opbuttons_color")
                    button.titleLabel?.textColor = UIColor(named: "blackBG_opbuttons_text_color")
                case 17:
                    button.backgroundColor = UIColor(named: "blackBG_equalbutton_color")
                    button.titleLabel?.textColor = UIColor(named: "blackBG_equaluttons_text_color")
                case 18:
                    button.backgroundColor = .black
                    button.titleLabel?.textColor = UIColor(named: "blackBG_tapped_text_color")
                default:
                    button.backgroundColor = .white
                    button.titleLabel?.textColor = .black
            }
        }
    }
}

