//
//  Bundle+Extras.swift
//  Pods
//
//  Created by Sergii Frost on 2017-08-04.
//
//

import Foundation

extension Bundle {
    static func frostBundle<T:AnyObject>(forClass clazz: T.Type) -> Bundle {
        let bundle = Bundle(for: clazz)
        if let path = bundle.path(forResource: "FrostComponents", ofType: "bundle") {
            return Bundle(path: path)!
        }
        else {
            return bundle
        }
    }
}
