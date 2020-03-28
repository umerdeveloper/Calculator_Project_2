//  ViewController.swift
//  Calculator_Project_2
//  Created by Umer Khan on 26/03/2020.
//  Copyright © 2020 Umer Khan. All rights reserved.

import UIKit

class ViewController: UIViewController {
    
    let performOperation = Operation()
    
    // MARK: - UI Components
    @IBOutlet weak var tappedButtonsTextView: UITextView!
    @IBOutlet weak var calculatedAnswerTextView: UITextView!
    @IBOutlet var allButtons: [UIButton]!
    
    // MARK: - Logic Supporting Properties
    var numberOnScreen: Double = 0
    var previousNumber: Double = 0
    var operation: Int = 0
    var isPerfromingOperation: Bool = false
    
    // MARK: - UI Supporting Properties
    var isDarkMode: Bool = false
    let whiteAppearanceMoonIcon = #imageLiteral(resourceName: "moon")
    let darkAppearanceSunIcon = #imageLiteral(resourceName: "sun")

    //MARK: - App Appearance
    @IBAction func appearanceButtonTapped(_ sender: UIButton) {
        isDarkMode = !isDarkMode
        if !isDarkMode {
            sender.setImage(whiteAppearanceMoonIcon, for: .normal)
            colorsForLightMode()
        }
        else if isDarkMode {
            sender.setImage(darkAppearanceSunIcon, for: .normal)
            colorsForDarkMode()
        }
    }
    
    // MARK: - Numbers Action
    @IBAction func numbersTapped(_ sender: UIButton) {
        if isPerfromingOperation {
            tappedButtonsTextView.text = String(sender.tag)
            numberOnScreen = Double(tappedButtonsTextView.text!) ?? 0
            isPerfromingOperation = false
        }
        else if sender.tag != performOperation.dot && sender.tag != 0 {
            tappedButtonsTextView.text += String(sender.tag)
            print("textview number: \(tappedButtonsTextView.text!)")
            numberOnScreen = Double(tappedButtonsTextView.text)!
            print("previous number before operation \(numberOnScreen)")
        }
        else if sender.tag == performOperation.dot {
            // if dot again press
            if tappedButtonsTextView.text.contains(".") { return }
            // else appened into text
            tappedButtonsTextView.text += "."
            print("textview number: \(tappedButtonsTextView.text!)")
            numberOnScreen = Double(tappedButtonsTextView.text)!
            print("previous number before operation \(numberOnScreen)")
        }
        else if sender.tag == 0 {
            if tappedButtonsTextView.text == "" { return }
            tappedButtonsTextView.text += "0"
        }
    }
    
    // MARK: - Operations Action
    @IBAction func operationsButtonsTapped(_ sender: UIButton) {
        if tappedButtonsTextView.text != "" {
            previousNumber = Double(Double(tappedButtonsTextView.text!)!)
            print("first previous number: \(previousNumber)\n")
        }
        
        if  tappedButtonsTextView.text != "" && // textview not empty
            sender.tag != performOperation.clearScreen &&
        sender.tag != performOperation.result && sender.tag != performOperation.percentage {
            
            if sender.tag == performOperation.divide { tappedButtonsTextView.text += "/" }
            if sender.tag == performOperation.multiply { tappedButtonsTextView.text += "X" }
            if sender.tag == performOperation.subtract { tappedButtonsTextView.text += "-" }
            if sender.tag == performOperation.add { tappedButtonsTextView.text += "+" }
            
            operation = sender.tag
            isPerfromingOperation = true
        }
            
            if sender.tag == performOperation.result {
            
            tappedButtonsTextView.text = ""
            print("number on scree: \(numberOnScreen)\n")
            print("Previous value: \(previousNumber)")
            
            if operation == performOperation.percentage { calculatedAnswerTextView.text = String(previousNumber / 100) }
            else if operation == performOperation.divide { calculatedAnswerTextView.text = String(previousNumber / numberOnScreen) }
            else if operation == performOperation.multiply { calculatedAnswerTextView.text = String(previousNumber * numberOnScreen) }
            else if operation == performOperation.subtract { calculatedAnswerTextView.text = String(previousNumber - numberOnScreen) }
            else if operation == performOperation.add { calculatedAnswerTextView.text = String(previousNumber + numberOnScreen) }
        }
            
            if sender.tag == performOperation.clearScreen {
            calculatedAnswerTextView.text = ""
            tappedButtonsTextView.text = ""
            numberOnScreen = 0
            previousNumber = 0
            operation = 0
        }
        else { return }
    }
}


extension ViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tappedButtonsTextView.text = ""
        calculatedAnswerTextView.text = "0"
        
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
                    //button.titleLabel?.textColor = UIColor(named: "output_text_color")
                    button.setTitleColor(UIColor(named: "output_text_color"), for: .normal)
                    
                case 10...16:
                    button.backgroundColor = UIColor(named: "whiteBG_opbuttons_green")
                    //button.titleLabel?.textColor = UIColor(named: "whiteBG_opbuttons_text_color")
                    button.setTitleColor(UIColor(named: "whiteBG_opbuttons_text_color"), for: .normal)
                case 17:
                    button.backgroundColor = UIColor(named: "whiteGB_equal_red")
                    //button.titleLabel?.textColor = UIColor(named: "whiteBG_equal_text_color")
                    button.setTitleColor(UIColor(named: "whiteBG_equal_text_color"), for: .normal)
                case 18:
                    button.backgroundColor = UIColor(named: "whiteBG_numbuttons_color")
                    //button.titleLabel?.textColor = UIColor(named: "output_text_color")
                    button.setTitleColor(UIColor(named: "output_text_color"), for: .normal)
                default:
                    button.backgroundColor = .black
                    button.setTitleColor(.white, for: .normal)
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
                    //button.titleLabel?.textColor = UIColor(named: "blackBG_tapped_text_color")
                    button.setTitleColor(UIColor(named: "blackBG_tapped_text_color"), for: .normal)
                case 10...16:
                    button.backgroundColor = UIColor(named: "blackBG_opbuttons_color")
                    //button.titleLabel?.textColor = UIColor(named: "blackBG_opbuttons_text_color")
                    button.setTitleColor(UIColor(named: "blackBG_opbuttons_text_color"), for: .normal)
                case 17:
                    button.backgroundColor = UIColor(named: "blackBG_equalbutton_color")
                   // button.titleLabel?.textColor = UIColor(named: "blackBG_equaluttons_text_color")
                    button.setTitleColor(UIColor(named: "blackBG_equaluttons_text_color"), for: .normal)
                case 18:
                    button.backgroundColor = .black
                    //button.titleLabel?.textColor = UIColor(named: "blackBG_tapped_text_color")
                    button.setTitleColor(UIColor(named: "blackBG_tapped_text_color"), for: .normal)
                
                default:
                    button.backgroundColor = .white
                    button.setTitleColor(.black, for: .normal)
            }
        }
    }
}

