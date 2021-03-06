//
//  FrostActionButton.swift
//  FrostComponents
//
//  Created by Sergii Frost on 2017-08-03.
//

import UIKit

public typealias FRButtonAction = (FRActionButton) -> Void

open class FRActionButton: FRButton {
    public var touchDownAction: FRButtonAction?
    public var touchUpAction: FRButtonAction?
    public var touchExitAction: FRButtonAction?
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupActions()
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupActions()
    }
    
    func setupActions() {
        addTarget(self, action: #selector(touchDown(sender:)), for: [.touchDown, .touchDragEnter])
        addTarget(self, action: #selector(touchExit(sender:)), for: [.touchCancel, .touchDragExit])
        addTarget(self, action: #selector(touchUp(sender:)), for: [.touchUpInside])
    }
    
    //actions
    @objc func touchDown(sender: FRActionButton) {
        touchDownAction?(sender)
    }
    
    @objc func touchExit(sender: FRActionButton) {
        touchExitAction?(sender)
    }
    
    @objc func touchUp(sender: FRActionButton) {
        touchUpAction?(sender)
    }
}
