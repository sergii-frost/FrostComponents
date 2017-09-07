//
//  FRNibLoadingView.swift
//  FrostComponents
//
//  Created by Sergii Frost on 2017-08-04.
//

import Foundation

open class FRNibLoadingView: UIView {
    
    fileprivate let kBundleName = "FRAlert"
    
    @IBOutlet weak var view: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        nibSetup()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        nibSetup()
    }
    
    private func nibSetup() {
        backgroundColor = .clear
        
        view = loadViewFromNib()
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.translatesAutoresizingMaskIntoConstraints = true
        
        addSubview(view)
    }
    
    func bundleName() -> String {
        return kBundleName
    }
    
    private func loadViewFromNib() -> UIView {
        let bundle = Bundle.frostBundle(forClass: type(of: self), bundleName: bundleName())
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        let nibView = nib.instantiate(withOwner: self, options: nil).first as! UIView
        
        return nibView
    }
}
