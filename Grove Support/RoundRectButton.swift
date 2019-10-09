//
//  RoundRectButton.swift
//  Grove Support
//
//  Created by Jon on 6/11/19.
//  Copyright © 2019 Jon. All rights reserved.
//

import UIKit

/// UIButton subclass that draws a rounded rectangle in its background.

public class RoundRectButton: UIButton {
    
    // MARK: Public interface
    
    /// Corner radius of the background rectangle
    public var roundRectCornerRadius: CGFloat = 4 {
        didSet {
            self.setNeedsLayout()
        }
    }
    
    /// Color of the background rectangle
    public var roundRectColor: UIColor = UIColor.clear {
        didSet {
            self.setNeedsLayout()
        }
    }
    
    // MARK: Overrides
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        layoutRoundRectLayer()
    }
    
    // MARK: Private
    
    private var roundRectLayer: CAShapeLayer?
    
    private func layoutRoundRectLayer() {
        if let existingLayer = roundRectLayer {
            existingLayer.removeFromSuperlayer()
        }
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = UIBezierPath(roundedRect: self.bounds, cornerRadius: roundRectCornerRadius).cgPath
        shapeLayer.fillColor = roundRectColor.cgColor
        self.layer.insertSublayer(shapeLayer, at: 0)
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.cornerRadius = 4
        self.roundRectLayer = shapeLayer
    }
}
