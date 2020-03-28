//  ViewController.swift
//  Calculator_Project_2
//  Created by Umer Khan on 26/03/2020.
//  Copyright © 2020 Umer Khan. All rights reserved.

import UIKit

class ViewController: UIViewController {
    
    let performOperation = Operation()
    
    // MARK: - UI Components
    #warning("set textview limit")
    @IBOutlet weak var tappedButtonsTextView: UITextView!
    @IBOutlet weak var calculatedAnswerTextView: UITextView!
    @IBOutlet var allButtons: [UIButton]!
    
    // MARK: - Logic Supporting Properties
    var numberOnScreen: Double = 0
    var previousNumber: Double = 0
    var operation: Int = 0
    var isPerfromingOperation: Bool = false
    let empty: String = ""
    var text: String = ""
    var negativeSign: String = "-"
    
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
    @IBAction func numbersButtonTapped(_ sender: UIButton) {
        
        // TODO: - Check Typing or Not
        if isPerfromingOperation {
            
            tappedButtonsTextView.text += String(sender.tag)
            numberOnScreen = Double(tappedButtonsTextView.text!) ?? 0
            isPerfromingOperation = false
        }
            
        // TODO: - Handle dot(.) and Zero
        else if sender.tag != performOperation.dot && sender.tag != 0 && sender.tag != performOperation.setNagative {
            print(tappedButtonsTextView.text!)
            tappedButtonsTextView.text += String(sender.tag)
            print(tappedButtonsTextView.text!)
            //numberOnScreen = Double(tappedButtonsTextView.text)!
        }
            
        // TODO: - Handle dot(.) on Start
        else if sender.tag == performOperation.dot && tappedButtonsTextView.text == empty {
            tappedButtonsTextView.text += "0."
            numberOnScreen = Double(tappedButtonsTextView.text)!
            print("dot press and text empty: \(numberOnScreen)")
        }
            
        // TODO: - Handle Zero on Start
        else if sender.tag == performOperation.zero {
            if tappedButtonsTextView.text == empty { return }
            tappedButtonsTextView.text += "0"
            //numberOnScreen = Double(tappedButtonsTextView.text)!
        }
            
        // TODO: - Handle dot(.) add only once
        else if sender.tag == performOperation.dot && tappedButtonsTextView.text != empty {
            text = tappedButtonsTextView.text!
            // dot should not come after operator
            if tappedButtonsTextView.text.contains(".") || inLastNotDigit(text) { return }
            tappedButtonsTextView.text += "."
            #warning("how to append dot in double value")
            //numberOnScreen = Double(tappedButtonsTextView.text)!
        }
            
        // TODO: - Handle -ve value (-) add
        else if sender.tag == performOperation.setNagative {
            if tappedButtonsTextView.text.contains("-") || tappedButtonsTextView.text == empty { return }
            #warning("work on positive sign")
            // add to the start of textView
            negativeSign += tappedButtonsTextView.text
            tappedButtonsTextView.text = negativeSign
           // numberOnScreen = Double(tappedButtonsTextView.text)!
        }
    }
    // MARK: - Result Logic
    #warning("work on result")
    #warning("if textview last digit is . return")
    #warning("add dot after operator and numbers")
    @IBAction func resultButtonTapped(_ sender: UIButton) {
        text = tappedButtonsTextView.text!
        if tappedButtonsTextView.text == empty ||
            inLastNotDigit(text) || text.last == "." { return }
        else {
            
            text = String(tappedButtonsTextView.text!)
            let answer = Double(text)
            print(answer)
            
            
            
            
            
            
            
            
        }
        
        
        
        
    }
    
    
    
    // MARK: - Operations Action
    @IBAction func operationsButtonsTapped(_ sender: UIButton) {
        // + - x ÷
        text = tappedButtonsTextView.text!
        if tappedButtonsTextView.text == empty || text.last == "." { return }
        
        
        if sender.tag == performOperation.divide {
            if  inLastNotDigit(text) { return }
            else { tappedButtonsTextView.text += "÷" }
            }
        
        if sender.tag == performOperation.multiply {
            if  inLastNotDigit(text) { return }
            else { tappedButtonsTextView.text += "x" }
        }
        
        if sender.tag == performOperation.add {
            if  inLastNotDigit(text) { return }
            else { tappedButtonsTextView.text += "+" }
        }
        
        if sender.tag == performOperation.subtract {
            if  inLastNotDigit(text) { return }
            else { tappedButtonsTextView.text += "-" }
        }
    }
    
    func inLastNotDigit(_ text: String) -> Bool {
        if  text.last == "÷" ||
        text.last == "-" ||
        text.last == "+" ||
        text.last == "x" { return true }
        else { return false }
    }
    
    // MARK: - Find Percentage
    @IBAction func percentageButtonTapped(_ sender: UIButton) {
        
        if  tappedButtonsTextView.text.contains("+") ||
            tappedButtonsTextView.text.contains("-") ||
            tappedButtonsTextView.text.contains("÷") ||
            tappedButtonsTextView.text.contains("x") ||
            tappedButtonsTextView.text == empty { return }
            
        else {
            var value = Double(tappedButtonsTextView.text)!
            value = value / 100
            calculatedAnswerTextView.text = String(value)
        }
    }
    
    // MARK: - Clear Screen
    @IBAction func clearButtonTapped(_ sender: UIButton) {
        
        calculatedAnswerTextView.text = "0"
        tappedButtonsTextView.text = ""
        numberOnScreen = 0
        previousNumber = 0
        operation = 0
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

