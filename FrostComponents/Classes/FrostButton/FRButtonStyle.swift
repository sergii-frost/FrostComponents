//
//  FRButtonStyle.swift
//  FrostComponents
//
//  Created by Sergii Frost on 2017-08-03.
//

import UIKit

public struct FRButtonStyle {
    public var titleColor: UIColor
    public var borderColor: UIColor
    public var borderWidth: CGFloat
    public var cornerRadius: CGFloat
    public var normalColor: UIColor?
    public var disabledColor: UIColor?
    public var selectedColor: UIColor?
    public var highlightedColor: UIColor?
    
    public init(titleColor: UIColor,
                borderColor: UIColor,
                borderWidth: CGFloat,
                cornerRadius: CGFloat,
                normalColor: UIColor? = nil,
                disabledColor: UIColor? = nil,
                selectedColor: UIColor? = nil,
                highlightedColor: UIColor? = nil) {
        
        self.titleColor = titleColor
        self.borderColor = borderColor
        self.borderWidth = borderWidth
        self.cornerRadius = cornerRadius
        self.normalColor = normalColor
        self.disabledColor = disabledColor
        self.selectedColor = selectedColor
        self.highlightedColor = highlightedColor
    }
    
}
