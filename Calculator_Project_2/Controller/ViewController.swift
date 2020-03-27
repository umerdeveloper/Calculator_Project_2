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
    
    // MARK: - Supporting Properties
    var isDarkMode: Bool = false
    let whiteAppearanceMoonIcon = #imageLiteral(resourceName: "moon")
    let darkAppearanceSunIcon = #imageLiteral(resourceName: "sun")

    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func appearanceButtonTapped(_ sender: UIButton) {
        //TODO: - Change Icon
        print(sender.tag)
        isDarkMode = !isDarkMode
        if isDarkMode && sender.tag == 19 {
            sender.setImage(whiteAppearanceMoonIcon, for: .normal)
            
            
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
            
            // equal button color
            
            
            
        }
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
    }
    
    
    @IBAction func calculaterButtons(_ sender: UIButton) {
       
        
    }
}

