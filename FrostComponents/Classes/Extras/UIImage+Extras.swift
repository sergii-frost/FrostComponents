//
//  UIImage+Extras.swift
//  FrostComponents
//
//  Created by Sergii Frost on 2017-08-03.
//

import UIKit

extension UIImage {
    public static func image(fromColor color: UIColor?) -> UIImage? {
        let color = color ?? UIColor.clear
        
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        
        guard let context = UIGraphicsGetCurrentContext() else {
            UIGraphicsEndImageContext()
            return nil
        }
        context.setFillColor(color.cgColor)
        context.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
    public static func image(color: UIColor?, bounds: CGRect, cornerRadius radius: CGFloat) -> UIImage? {
        let color = color ?? UIColor.clear
        
        let rect = CGRect(x: 0.0, y: 0.0, width: bounds.size.width, height: bounds.size.height)
        UIGraphicsBeginImageContext(rect.size)
        
        guard let context = UIGraphicsGetCurrentContext() else {
            UIGraphicsEndImageContext()
            return nil
        }
        
        context.setFillColor(color.cgColor)
        let path = UIBezierPath(roundedRect: rect, cornerRadius: radius)
        context.addPath(path.cgPath)
        context.fillPath()
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}
