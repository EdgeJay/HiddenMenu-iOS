//
//  MenuView.swift
//  HiddenMenu
//
//  Created by Wu Huijie on 4/11/15.
//  Copyright © 2015 EdgeJay. All rights reserved.
//

import UIKit

enum MenuViewItem {
    case Red
    case Green
    case Blue
    case Close
    
    static let allValues = [Red, Green, Blue, Close]
}

protocol MenuViewDelegate {
    func menuView(view: MenuView, itemSelected: MenuViewItem)
}

class MenuView: UIView {
    var redButton: UIButton?
    var greenButton: UIButton?
    var blueButton: UIButton?
    var closeButton: UIButton?
    var delegate: MenuViewDelegate?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    private func initialize() {
        self.opaque = false
        
        // setup buttons
        let buttonWidth = CGFloat(Float(self.bounds.width) / Float(MenuViewItem.allValues.count))
        let buttonHeight = self.bounds.height
        // red
        redButton = UIButton(frame: CGRectMake(0, 0, buttonWidth, buttonHeight))
        redButton?.setTitle("Red", forState: .Normal)
        redButton?.addTarget(self, action: Selector("onButtonClicked:"), forControlEvents: .TouchUpInside)
        addSubview(redButton!)
        // green
        greenButton = UIButton(frame: CGRectMake(buttonWidth, 0, buttonWidth, buttonHeight))
        greenButton?.setTitle("Green", forState: .Normal)
        greenButton?.addTarget(self, action: Selector("onButtonClicked:"), forControlEvents: .TouchUpInside)
        addSubview(greenButton!)
        // blue
        blueButton = UIButton(frame: CGRectMake(buttonWidth * 2, 0, buttonWidth, buttonHeight))
        blueButton?.setTitle("Blue", forState: .Normal)
        blueButton?.addTarget(self, action: Selector("onButtonClicked:"), forControlEvents: .TouchUpInside)
        addSubview(blueButton!)
        // close
        closeButton = UIButton(frame: CGRectMake(buttonWidth * 3, 0, buttonWidth, buttonHeight))
        closeButton?.setTitle("Close", forState: .Normal)
        closeButton?.addTarget(self, action: Selector("onButtonClicked:"), forControlEvents: .TouchUpInside)
        addSubview(closeButton!)
    }
    
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        
        let context = UIGraphicsGetCurrentContext()
        CGContextSetFillColorWithColor(context, UIColor(red: 0.75, green: 0.75, blue: 0.75, alpha: 0.5).CGColor)
        CGContextFillRect(context, self.bounds)
    }
    
    func onButtonClicked(sender: AnyObject) {
        if let delegate = self.delegate, button = (sender as? UIButton) {
            if button == redButton {
                delegate.menuView(self, itemSelected: .Red)
            }
            else if button == greenButton {
                delegate.menuView(self, itemSelected: .Green)
            }
            else if button == blueButton {
                delegate.menuView(self, itemSelected: .Blue)
            }
            else if button == closeButton {
                delegate.menuView(self, itemSelected: .Close)
            }
        }
    }
}
