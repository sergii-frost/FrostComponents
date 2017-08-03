//
//  ViewController.swift
//  FrostComponents
//
//  Created by sergii-frost on 08/03/2017.
//  Copyright (c) 2017 sergii-frost. All rights reserved.
//

import UIKit
import FrostComponents

class ViewController: UIViewController {
    
    @IBOutlet weak var button1: FRActionButton!
    @IBOutlet weak var button2: FRActionButton!
    @IBOutlet weak var button3: FRActionButton!
    @IBOutlet weak var clearButton: FRActionButton!
    @IBOutlet weak var debugTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButtons()
    }
    
    private func setupButtons() {
        button1.style = FRButtonStyles.frostBlue
        button1.touchDownAction = {button in self.log("\(button.currentTitle ?? "") touchDownAction")}
        button1.touchUpAction = {button in self.log("\(button.currentTitle ?? "") touchUpAction")}
        button1.touchExitAction = {button in self.log("\(button.currentTitle ?? "") touchExitAction")}
        
        button2.style = FRButtonStyles.frostGreenNoBackground
        button2.touchDownAction = {button in self.log("\(button.currentTitle ?? "") touchDownAction")}
        button2.touchUpAction = {button in self.log("\(button.currentTitle ?? "") touchUpAction")}
        button2.touchExitAction = {button in self.log("\(button.currentTitle ?? "") touchExitAction")}

        button3.style = FRButtonStyles.frostPurpleBlue
        button3.touchDownAction = {button in self.log("\(button.currentTitle ?? "") touchDownAction")}
        button3.touchUpAction = {button in self.log("\(button.currentTitle ?? "") touchUpAction")}
        button3.touchExitAction = {button in self.log("\(button.currentTitle ?? "") touchExitAction")}

        clearButton.style = FRButtonStyles.frostOrange
        clearButton.touchUpAction = {button in
            self.clearLog()
            let styles = [FRButtonStyles.frostBlue, FRButtonStyles.frostGreenNoBackground, FRButtonStyles.frostPurpleBlue]
            [self.button1, self.button2, self.button3].forEach({ (button: FRActionButton?) in
                button?.style = styles.sample()
            })
        }
    }
    
    private func log(_ message: String) {
        debugTextView.text = "\(message)\n" + debugTextView.text
    }
    
    private func clearLog() {
        debugTextView.text = ""
    }
}

extension Array {
    func sample() -> Element {
        let index = Int(arc4random_uniform(UInt32(self.count)))
        return self[index]
    }
}
