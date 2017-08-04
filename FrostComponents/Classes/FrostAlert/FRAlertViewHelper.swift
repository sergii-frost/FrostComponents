//
//  FRAlertViewHelper.swift
//  FrostComponents
//
//  Created by Sergii Frost on 2017-08-04.
//

import UIKit

public class FRAlertViewHelper {
    
    private static let kWidthMultiplier: CGFloat = 0.8
    private static let kDefaulthMultiplier: CGFloat = 1.0
    private static let kZero: CGFloat = 0.0
    
    private init() {
        //Avoid instantiation
    }
    
    public static func show(in viewController: UIViewController?,
                            style: FRAlertViewStyle? = nil,
                            title: String?,
                            message: String?,
                            actions: FRAlertViewAction...,
                            shouldAddOverlay: Bool = true) {
        guard let viewController = viewController else {
            return
        }
        
        var overlay: UIView?
        if shouldAddOverlay {
            overlay = addOverlay(to: viewController)
        }
        
        let alert = alertView(withStyle: style, title: title, message: message)
        add(alertView: alert, overlay: overlay, to: viewController)
        let dismissAction: FRButtonAction = {_ in dismiss(views: alert, overlay)}
        actions.forEach({ (action: FRAlertViewAction) in
            alert.add(action: action, dismissAction: dismissAction)
        })
    }
    
    private static func alertView(withStyle style: FRAlertViewStyle?, title: String?, message: String?) -> FRAlertView {
        let alertView = FRAlertView()
        alertView.title = title
        alertView.message = message
        alertView.style = style
        
        return alertView
    }
    
    private static func addOverlay(to viewController: UIViewController) -> UIView? {
        guard let superView = viewController.view.superview else {
            return nil
        }
        
        let overlay = UIView();
        overlay.translatesAutoresizingMaskIntoConstraints = false
        overlay.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        overlay.alpha = 0.0
        superView.addSubview(overlay)
        
        let widthConstraint = NSLayoutConstraint(item: overlay,
                                                 attribute: .width,
                                                 relatedBy: .equal,
                                                 toItem: superView,
                                                 attribute: .width,
                                                 multiplier: kDefaulthMultiplier,
                                                 constant: kZero)
        
        let heightConstraint = NSLayoutConstraint(item: overlay,
                                                  attribute: .height,
                                                  relatedBy: .equal,
                                                  toItem: superView,
                                                  attribute: .height,
                                                  multiplier: kDefaulthMultiplier,
                                                  constant: kZero)
        
        superView.addConstraints([widthConstraint, heightConstraint])
        superView.setNeedsUpdateConstraints()
        superView.layoutIfNeeded()
        
        return overlay
    }
    
    private static func add(alertView: FRAlertView, overlay:UIView?, to viewController: UIViewController) {
        guard let superView = viewController.view.superview else {
            return
        }
        
        alertView.translatesAutoresizingMaskIntoConstraints = false
        alertView.alpha = 0.0
        superView.addSubview(alertView)
        
        //Set up constraints now
        let widthConstraint = NSLayoutConstraint(item: alertView,
                                                 attribute: .width,
                                                 relatedBy: .equal,
                                                 toItem: superView,
                                                 attribute: .width,
                                                 multiplier: kWidthMultiplier,
                                                 constant: kZero)
        
        let horizontalCenterConstraint = NSLayoutConstraint(item: alertView,
                                                            attribute: .centerX,
                                                            relatedBy: .equal,
                                                            toItem: superView,
                                                            attribute: .centerX,
                                                            multiplier: kDefaulthMultiplier,
                                                            constant: kZero)
        
        let verticalCenterConstraint = NSLayoutConstraint(item: alertView,
                                                          attribute: .centerY,
                                                          relatedBy: .equal,
                                                          toItem: superView,
                                                          attribute: .centerY,
                                                          multiplier: kDefaulthMultiplier,
                                                          constant: kZero)
        
        superView.addConstraints([widthConstraint, horizontalCenterConstraint, verticalCenterConstraint])
        superView.setNeedsUpdateConstraints()
        superView.layoutIfNeeded()
        
        UIView.animate(withDuration: CATransaction.animationDuration()) {
            overlay?.alpha = 1.0
            alertView.alpha = 1.0
        }
    }
    
    private static func dismiss(views: UIView?...) {
        UIView.animate(withDuration: CATransaction.animationDuration(), animations: {
            views.forEach({ (view: UIView?) in
                view?.alpha = 0.0
            })
        }) { (isFinished: Bool) in
            if !isFinished {
                return
            }
            views.forEach({ (view: UIView?) in
                remove(view: view)
            })
            
        }
    }
    
    private static func remove(view: UIView?) {
        guard let view = view, let superView = view.superview else {
            return
        }
        
        superView.removeConstraints(superView.constraints.filter({ (constraint: NSLayoutConstraint) -> Bool in
            return constraint.firstItem === view || constraint.secondItem === view
        }))
        view.removeFromSuperview()
    }
}
