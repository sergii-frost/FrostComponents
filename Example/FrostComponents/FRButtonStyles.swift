//
//  FRButteStyles.swift
//  FrostComponents
//
//  Created by Sergii Frost on 2017-08-03.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit
import FrostComponents

public class FRButtonStyles {
    private init() {
        //Avoid instantiation
    }
    
    static let frostBlue: FRButtonStyle = {
        return FRButtonStyle(
            titleColor: UIColor.white,
            borderColor: UIColor.frostBlue(),
            borderWidth: 1.0,
            cornerRadius: 6.0,
            normalColor: UIColor.frostBlue(),
            disabledColor: UIColor.lightGray,
            selectedColor: UIColor.frostBlue(),
            highlightedColor: UIColor.frostBlue()
        )
    }()
    
    static let frostOrange: FRButtonStyle = {
        return FRButtonStyle(
            titleColor: UIColor.white,
            borderColor: UIColor.clear,
            borderWidth: 0.0,
            cornerRadius: 0.0,
            normalColor: UIColor.frostOrange(),
            disabledColor: UIColor.lightGray,
            selectedColor: UIColor.frostOrange(),
            highlightedColor: UIColor.frostOrange()
        )
    }()

    
    static let frostGreenNoBackground: FRButtonStyle = {
        return FRButtonStyle(
            titleColor: UIColor.frostGreen(),
            borderColor: UIColor.frostGreen(),
            borderWidth: 1.0,
            cornerRadius: 6.0
        )
    }()

    static let frostPurpleBlue: FRButtonStyle = {
        return FRButtonStyle(
            titleColor: UIColor.white,
            borderColor: UIColor.clear,
            borderWidth: 0.0,
            cornerRadius: 6.0,
            normalColor: UIColor.frostPurple(),
            disabledColor: UIColor.lightGray,
            selectedColor: UIColor.frostBlue(),
            highlightedColor: UIColor.frostBlue()
        )
    }()
}

extension UIColor {
    public static func frostBlue() -> UIColor {
        //HEX #00adec
        return UIColor(red: 0.0, green: 173.0/255, blue: 236.0/255, alpha: 1.0)
    }
    
    public static func frostGreen() -> UIColor {
        //HEX #c6db46
        return UIColor(red: 198.0/255, green: 219.0/255, blue: 70.0/255, alpha: 1.0)
    }

    public static func frostPurple() -> UIColor {
        //HEX #7a43b6
        return UIColor(red: 122.0/255, green: 67.0/255, blue: 182.0/255, alpha: 1.0)
    }

    public static func frostOrange() -> UIColor {
        //HEX #f47f47
        return UIColor(red: 244.0/255, green: 127.0/255, blue: 71.0/255, alpha: 1.0)
    }

}
