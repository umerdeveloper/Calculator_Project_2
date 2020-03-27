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
        if isDarkMode && sender.tag == 19 {
            sender.setImage(whiteAppearanceMoonIcon, for: .normal)
            // set view white
            view.backgroundColor = .white
            
            // answer textView color
            calculatedAnswerTextView.textColor = UIColor(named: "output_text_color")
            calculatedAnswerTextView.backgroundColor = .white
            
            // tapped textView color
            tappedButtonsTextView.textColor = UIColor(named: "tappedtext_color")
            tappedButtonsTextView.backgroundColor = .white
            
            //MARK: - Buttons color for whiteBG
            for button in allButtons {
                //TODO: = color change
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
        else if !isDarkMode && sender.tag == 19 {
            sender.setImage(darkAppearanceSunIcon, for: .normal)
            view.backgroundColor = .black
            
            // answer textView Color
            calculatedAnswerTextView.backgroundColor = .black
            calculatedAnswerTextView.textColor = .white
            
            // tapped textview color
            tappedButtonsTextView.backgroundColor = .black
            tappedButtonsTextView.textColor = UIColor(named: "blackBG_tapped_text_color")
            
            //MARK: - Buttons Color for DarkMode
            for button in allButtons {
                //TODO: = color change
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
    
    
    @IBAction func numbersTapped(_ sender: UIButton) {
       
        
    }
    @IBAction func operationsButtonsTapped(_ sender: UIButton) {
        
    }
    
}

