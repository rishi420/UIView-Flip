//
//  UIView+Flip.swift
//  ViewFlip
//
//  Created by Warif Akhand Rishi on 4/27/16.
//  Copyright © 2016 Warif Akhand Rishi. All rights reserved.
//

import UIKit

extension UIView {
    
    func flipAnimation(completion: (() -> Void) = {}) {
        
        let angle = 180.0
        layer.transform = get3DTransformation(angle)
        
        UIView.animateWithDuration(1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: .TransitionNone, animations: { () -> Void in
            self.layer.transform = CATransform3DIdentity
            }) { (finished) -> Void in
                completion()
        }
    }
    
    private func get3DTransformation(angle: Double) -> CATransform3D {
        
        var transform = CATransform3DIdentity
        transform.m34 = -1.0 / 500.0
        transform = CATransform3DRotate(transform, CGFloat(angle * M_PI / 180.0), 0, 1, 0.0)
        
        return transform
    }
}