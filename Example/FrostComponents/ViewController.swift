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
        setupButton1()
        setupButton2()
        setupButton3()
        setupClearButton()
    }
    
    //MARK: - FRActionButton Demo
    
    private func setupButton1() {
        button1.style = FRButtonStyles.frostBlue
        button1.touchDownAction = {button in self.log("\(button.currentTitle ?? "") touchDownAction")}
        button1.touchExitAction = {button in self.log("\(button.currentTitle ?? "") touchExitAction")}
        button1.touchUpAction = {button in
            let buttonTitle = button.currentTitle ?? "Unknown button"
            self.log("\(buttonTitle) touchUpAction")
            self.showStyledAlertWithOneButton(title: "\(buttonTitle)", message: "\(buttonTitle) was tapped")
        }
    }
    
    private func setupButton2() {
        button2.style = FRButtonStyles.frostGreenNoBackground
        button2.touchDownAction = {button in self.log("\(button.currentTitle ?? "") touchDownAction")}
        button2.touchExitAction = {button in self.log("\(button.currentTitle ?? "") touchExitAction")}
        button2.touchUpAction = {button in
            self.log("\(button.currentTitle ?? "") touchUpAction")
            self.showNonStyledAlertWithTwoButtons()
        }
    }
    
    private func setupButton3() {
        button3.style = FRButtonStyles.frostPurpleBlue
        button3.touchDownAction = {button in self.log("\(button.currentTitle ?? "") touchDownAction")}
        button3.touchExitAction = {button in self.log("\(button.currentTitle ?? "") touchExitAction")}
        button3.touchUpAction = {button in
            self.log("\(button.currentTitle ?? "") touchUpAction")
            self.showAlertWithThreeStyledButtons()
        }
    }
    
    private func setupClearButton() {
        clearButton.style = FRButtonStyles.frostOrange
        clearButton.touchUpAction = {button in
            self.clearLog()
            let styles = [FRButtonStyles.frostBlue, FRButtonStyles.frostGreenNoBackground, FRButtonStyles.frostPurpleBlue]
            [self.button1, self.button2, self.button3].forEach({ (button: FRActionButton?) in
                button?.style = styles.sample()
            })
        }
    }
    
    //MARK: - FRAlert Demo
    
    private func showStyledAlertWithOneButton(title: String?, message: String?) {
        let alertStyle = FRAlertViewStyle(
            titleFont: nil,
            messageFont: nil,
            titleColor: UIColor.frostBlue(),
            messageColor: UIColor.frostPurple())
        
        FRAlertViewHelper.show(in: self,
                               style: alertStyle,
                               title: title,
                               message: message,
                               actions:
            FRAlertViewAction(title: "OK", titleColor:UIColor.frostPurple(), titleFont:UIFont.boldSystemFont(ofSize: UIFont.buttonFontSize), action: {alertButton in self.log("\(alertButton.currentTitle ?? "") was tapped")}))
    }
    
    private func showNonStyledAlertWithTwoButtons() {
        let alertButtonAction: FRButtonAction = {alertButton in self.log("\(alertButton.currentTitle ?? "") was tapped")}
        FRAlertViewHelper.show(in: self,
                               style: nil,
                               title: "Like emojis?",
                               message: "If there are only 2 buttons, they are placed next to each other. \n⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️",
                               actions:
            FRAlertViewAction(title: "⚔️", titleColor:UIColor.frostPurple(), titleFont:UIFont.boldSystemFont(ofSize: UIFont.buttonFontSize), action: alertButtonAction),
            FRAlertViewAction(title: "🛡", titleColor:UIColor.frostPurple(), titleFont:UIFont.boldSystemFont(ofSize: UIFont.buttonFontSize), action: alertButtonAction))
    }
    
    private func showAlertWithThreeStyledButtons() {
        let alertButtonAction: FRButtonAction = {alertButton in self.log("\(alertButton.currentTitle ?? "") was tapped")}
        let alertStyle = FRAlertViewStyle(
            titleFont: nil,
            messageFont: nil,
            titleColor: UIColor.frostBlue(),
            messageColor: UIColor.frostPurple(),            
            cornerRadius: 20.0,
            separatorColor: UIColor.frostOrange(),
            backgroundColor: UIColor.frostGreen()
        )
        
        FRAlertViewHelper.show(in: self,
                               style: alertStyle,
                               title: "3 styled buttons",
                               message: "Alert itself can by styled as well. \nEach button can have it's own style, its own action, any of them will dismiss alert",
                               actions:
            FRAlertViewAction(title: "Button 1", titleColor:UIColor.frostPurple(), titleFont:UIFont.boldSystemFont(ofSize: UIFont.buttonFontSize), action: alertButtonAction),
            FRAlertViewAction(title: "Button 2", titleColor:UIColor.frostOrange(), titleFont:UIFont.italicSystemFont(ofSize: UIFont.labelFontSize), action: alertButtonAction),
            FRAlertViewAction(title: "Button 3", titleColor:UIColor.frostBlue(), titleFont:UIFont.systemFont(ofSize: UIFont.smallSystemFontSize), action: alertButtonAction)
            )
    }
    
    
    //MARK: - Util functions
    
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
