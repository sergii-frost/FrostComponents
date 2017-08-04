//
//  FRAlertView.swift
//  FrostComponents
//
//  Created by Sergii Frost on 2017-08-04.
//

import UIKit

public struct FRAlertViewStyle {

    static let kDefaultTitleFont = UIFont.boldSystemFont(ofSize: UIFont.labelFontSize)
    static let kDefaultMessageFont = UIFont.systemFont(ofSize: UIFont.smallSystemFontSize)
    static let kCornerRadius: CGFloat = 12.0
    
    var titleFont: UIFont
    var messageFont: UIFont
    var titleColor: UIColor?
    var messageColor: UIColor?
    var cornerRadius: CGFloat
    var backgroundColor: UIColor?

    public init(titleFont: UIFont?,
                messageFont: UIFont?,
                titleColor: UIColor?,
                messageColor: UIColor?,
                cornerRadius: CGFloat = FRAlertViewStyle.kCornerRadius,
                backgroundColor: UIColor? = nil) {

        self.titleFont = titleFont ?? FRAlertViewStyle.kDefaultTitleFont
        self.titleColor = titleColor
        self.messageFont = messageFont ?? FRAlertViewStyle.kDefaultMessageFont
        self.messageColor = messageColor
        self.cornerRadius = cornerRadius
        self.backgroundColor = backgroundColor
    }
}

public struct FRAlertViewAction {
    var title: String
    var style: FRButtonStyle
    var action: FRButtonAction?
    
    public init(title: String, style: FRButtonStyle, action: FRButtonAction?) {
        self.title = title
        self.style = style
        self.action = action
    }
}

open class FRAlertView: FRNibLoadingView {

    let kDefaultStyle = FRAlertViewStyle(
        titleFont: FRAlertViewStyle.kDefaultTitleFont,
        messageFont: FRAlertViewStyle.kDefaultMessageFont,
        titleColor: UIColor.black,
        messageColor: UIColor.black)
    
    let kActionButtonHeight: CGFloat = 30.0
    
    @IBOutlet var contentView: UIView?
    @IBOutlet weak var titleLabel: UILabel?
    @IBOutlet weak var messageLabel: UILabel?
    @IBOutlet weak var actionsStackView: UIStackView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        stylize(with: kDefaultStyle)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        stylize(with: kDefaultStyle)
    }
    
    public var title: String? {
        didSet {
            titleLabel?.text = title
        }
    }
    
    public var message: String? {
        didSet {
            messageLabel?.text = message
        }
    }
    
    public var attributedMessage: NSAttributedString? {
        didSet {
            messageLabel?.attributedText = attributedMessage
        }
    }

    public var style: FRAlertViewStyle? {
        didSet {
            stylize(with: style ?? kDefaultStyle)
        }
    }
    
    private func stylize(with safeStyle: FRAlertViewStyle) {
        titleLabel?.font = safeStyle.titleFont
        messageLabel?.font = safeStyle.messageFont
        titleLabel?.textColor = safeStyle.titleColor ?? UIColor.black
        messageLabel?.textColor = safeStyle.messageColor ?? UIColor.black
        cornerRadius = safeStyle.cornerRadius
        contentView?.backgroundColor = safeStyle.backgroundColor
    }
    
    public func add(action: FRAlertViewAction, dismissAction: FRButtonAction?) {
        guard let actionsStackView = actionsStackView else {
            return
        }
        
        let actionButton = FRActionButton(frame: CGRect.zero)
        actionButton.touchUpAction = { button in
            action.action?(button)
            dismissAction?(button)
        }
        
        actionsStackView.addArrangedSubview(actionButton)
        actionButton.style = action.style
        actionButton.setTitle(action.title, for: .normal)
        let heightConstraint = NSLayoutConstraint(
            item: actionButton,
            attribute: .height,
            relatedBy: .equal,
            toItem: nil,
            attribute: .height,
            multiplier: 1.0,
            constant: kActionButtonHeight)
        
        actionButton.addConstraint(heightConstraint)
        
        actionsStackView.axis = actionsStackView.arrangedSubviews.count < 3 ? .horizontal : .vertical
    }
}
