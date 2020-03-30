//  ViewController.swift
//  Calculator_Project_2
//  Created by Umer Khan on 26/03/2020.
//  Copyright © 2020 Umer Khan. All rights reserved.

import UIKit

class ViewController: UIViewController {
    
    // MARK: - StatusBar Style
    override var preferredStatusBarStyle: UIStatusBarStyle {
        if isDarkMode { return .lightContent }
        else { return .default }
    }
    
    // MARK: - UI Components
    @IBOutlet weak var tappedButtonsTextView: UITextView!
    @IBOutlet weak var calculatedAnswerTextView: UITextView!
    @IBOutlet var allButtons: [UIButton]!
    
    // MARK: - Logic Supporting Properties
    let performOperation = Operation()
    var numberOnScreen: Double = 0
    var previousNumber: Double = 0
    var operation: Int = 0
    var isPerfromingOperation: Bool = false
    let empty: String = ""
    var text: String = ""
    var negativeSign: String = "-"
    var operatorResult: Double = 0.0
    var data: String = ""
    
    // MARK: - UI Supporting Properties
    var isDarkMode: Bool = false
    let whiteAppearanceMoonIcon = #imageLiteral(resourceName: "moon")
    let darkAppearanceSunIcon = #imageLiteral(resourceName: "sun")

    //MARK: - App Appearance
    @IBAction func appearanceButtonTapped(_ sender: UIButton) {
        
        isDarkMode = !isDarkMode
        if !isDarkMode {
            setNeedsStatusBarAppearanceUpdate()
            sender.setImage(whiteAppearanceMoonIcon, for: .normal)
            colorsForLightMode()
        }
        else if isDarkMode {
            setNeedsStatusBarAppearanceUpdate()
            sender.setImage(darkAppearanceSunIcon, for: .normal)
            colorsForDarkMode()
        }
    }
    
    // MARK: - Numbers Action
    @IBAction func operandsButtonTapped(_ sender: UIButton) {
        
        // TODO: - Check Typing or Not
        if isPerfromingOperation {
            #warning("append if want to see list of all buttons 2+2x3 etc")
            
            tappedButtonsTextView.text = String(sender.tag)
            numberOnScreen = Double(tappedButtonsTextView.text!)!
            isPerfromingOperation = false
        }
            
        // TODO: - Handle dot(.) and Zero
        else if sender.tag != performOperation.dot && sender.tag != 0 {
            tappedButtonsTextView.text += String(sender.tag)
            numberOnScreen = Double(tappedButtonsTextView.text)!
        }
            
        // TODO: - Handle dot(.) on Start
        else if sender.tag == performOperation.dot && tappedButtonsTextView.text == empty {
            tappedButtonsTextView.text += "0."
            numberOnScreen = Double(tappedButtonsTextView.text)!
        }
            
        // TODO: - Handle Zero on Start
        else if sender.tag == performOperation.zero {
            if tappedButtonsTextView.text == empty { return }
            tappedButtonsTextView.text += "0"
            numberOnScreen = Double(tappedButtonsTextView.text)!
        }
            
        // TODO: - Handle dot(.) add only once
        else if sender.tag == performOperation.dot && tappedButtonsTextView.text != empty {
            text = tappedButtonsTextView.text!
            // dot should not come after operator
            if tappedButtonsTextView.text.contains(".") { return }
            else if inLastNotDigit(text) { return }
            else  {
            tappedButtonsTextView.text += "."
            numberOnScreen = Double(tappedButtonsTextView.text)!
            }
        }
            
        // TODO: - Handle -ve value (-) add
        
    }
    
    @IBAction func positiveNegativeButtonTapped(_ sender: UIButton) {
        text = tappedButtonsTextView.text
        calculatedAnswerTextView.text = "0"
        
        if text == empty { tappedButtonsTextView.text = "-" }
        else if text.contains("-") { return }
        else if inLastNotDigit(text) { return }
        else {
            negativeSign = "-"
            negativeSign += tappedButtonsTextView.text
            tappedButtonsTextView.text = negativeSign
            previousNumber = Double(tappedButtonsTextView.text!)!
        }
    }
    
    // MARK: - Result Logic
    @IBAction func equalOperatorButtonTapped(_ sender: UIButton) {
        text = tappedButtonsTextView.text!
        
        if tappedButtonsTextView.text == empty ||
            inLastNotDigit(text) || text.last == "." { return }
        else {
            
            if operation == performOperation.add {
                operatorResult = previousNumber + numberOnScreen
                data = String(operatorResult)
                isItDecimal(data)
            }
            if operation == performOperation.divide {
                if numberOnScreen == 0 { calculatedAnswerTextView.text = "Invalid" }
                else {
                    operatorResult = previousNumber / numberOnScreen
                    data = String(operatorResult)
                    isItDecimal(data)
                }
                
            }
            if operation == performOperation.multiply {
                operatorResult = previousNumber * numberOnScreen
                data = String(operatorResult)
                isItDecimal(data)
            }
            if operation == performOperation.subtract {
                operatorResult = previousNumber - numberOnScreen
                data = String(operatorResult)
                isItDecimal(data)
            }
        }
        tappedButtonsTextView.text = empty
        numberOnScreen = 0
        
    }
    
    
    
    // MARK: - Operations Action
    @IBAction func operationsButtonsTapped(_ sender: UIButton) {
        // store previous value
            text = tappedButtonsTextView.text!
        // if text.first == "-" { return }
        if tappedButtonsTextView.text == empty { return }
        if tappedButtonsTextView.text != empty {
            text = tappedButtonsTextView.text
            previousNumber = Double(text)!
        }
        else if text.last == "." { return }
        // + - x ÷
        else if tappedButtonsTextView.text != empty && text.last == "." { return }
        
        else if sender.tag == performOperation.divide {
            if  inLastNotDigit(text) { return }
            else { tappedButtonsTextView.text += "÷" }
            }
        
        else if sender.tag == performOperation.multiply {
            if  inLastNotDigit(text) { return }
            else { tappedButtonsTextView.text += "x" }
        }
        
        else if sender.tag == performOperation.add {
            if  inLastNotDigit(text) { return }
            else { tappedButtonsTextView.text += "+" }
        }
        
        else if sender.tag == performOperation.subtract {
            if  inLastNotDigit(text) { return }
            else { tappedButtonsTextView.text += "-" }
        }
        
        operation = sender.tag
        isPerfromingOperation = true
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
        calculatedAnswerTextView.text = "0"
        text = tappedButtonsTextView.text!
        
        if text.first == "-" {
           var value = Double(tappedButtonsTextView.text)!
            value =  value / 100
            calculatedAnswerTextView.text = String(value)
        }
        
        
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
        tappedButtonsTextView.text = empty
    }
    
    // MARK: - Clear Screen
    @IBAction func clearButtonTapped(_ sender: UIButton) {
        
        calculatedAnswerTextView.text = "0"
        tappedButtonsTextView.text = empty
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
        tappedButtonsTextView.textContainer.maximumNumberOfLines = 1
        calculatedAnswerTextView.textContainer.maximumNumberOfLines = 1
        
    }
    // TODO: - LightMode
    func colorsForLightMode() {
        
        //UIApplication.shared.statusBarStyle = .default
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
        
        //UIApplication.shared.statusBarStyle = .lightContent
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
    
    func isItDecimal(_ data: String) -> Void {
        print(data)
        var letters = [String]()
            letters = data.map{ String($0) }
        let len = letters.count
        if letters.last == "0" && letters[len-2] == "." {
            letters.remove(at: len-1)
            letters.removeLast()
            let str = letters.joined()
            calculatedAnswerTextView.text = str
        }
        else {
            calculatedAnswerTextView.text = data
        }
    }
}

