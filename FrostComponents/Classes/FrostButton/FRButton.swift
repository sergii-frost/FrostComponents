//
//  FRButton.swift
//  FrostComponents
//
//  Created by Sergii Frost on 2017-08-03.
//

import UIKit

@IBDesignable
public class FRButton: UIButton {
    
    @IBInspectable public var borderWidth: CGFloat = 0.0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable public var borderColor: UIColor? {
        didSet {
            layer.borderColor = borderColor?.cgColor
        }
    }
    
    @IBInspectable public var cornerRadius: CGFloat = 0.0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
    
    @IBInspectable public var disabledColor: UIColor? {
        didSet {
            setBackgroundImage(UIImage.image(fromColor: disabledColor), for: .disabled)
        }
    }
    
    @IBInspectable public var normalColor: UIColor? {
        didSet {
            setBackgroundImage(UIImage.image(fromColor: normalColor), for: .normal)
        }
    }
    
    @IBInspectable public var highlightedColor: UIColor? {
        didSet {
            setBackgroundImage(UIImage.image(fromColor: highlightedColor), for: .highlighted)
        }
    }
    
    @IBInspectable public var selectedColor: UIColor? {
        didSet {
            setBackgroundImage(UIImage.image(fromColor: selectedColor), for: .selected)
        }
    }
    
    
    public var style: FRButtonStyle? {
        didSet {
            stylize(from: style)
        }
    }
    
    fileprivate func stylize(from style: FRButtonStyle?) {
        guard let safeStyle = style else {
            return
        }
        borderWidth = safeStyle.borderWidth
        borderColor = safeStyle.borderColor
        cornerRadius = safeStyle.cornerRadius
        normalColor = safeStyle.normalColor
        disabledColor = safeStyle.disabledColor
        selectedColor = safeStyle.selectedColor
        highlightedColor = safeStyle.highlightedColor
        
        let states: [UIControlState] = [.normal, .highlighted, .selected, .disabled]
        states.forEach({state in
            setTitleColor(safeStyle.titleColor, for: state)
        })
    }
}
