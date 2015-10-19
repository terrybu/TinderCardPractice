//
//  TinderCardDraggableView.swift
//  PracticeTinderSwipeCard
//
//  Created by Terry Bu on 10/19/15.
//  Copyright © 2015 Terry Bu. All rights reserved.
//

import UIKit
import Darwin

class TinderCardDraggableView: UIView {
    
    var panGestureRecognizer: UIPanGestureRecognizer!
    var originalPoint: CGPoint!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.panGestureRecognizer = UIPanGestureRecognizer(target: self, action: "dragged:")
        addGestureRecognizer(panGestureRecognizer)
        self.backgroundColor = UIColor.grayColor()
        loadImageAndStyle(frame)
    }
    
    private func loadImageAndStyle(frame: CGRect) {
        let imageView = UIImageView(image: UIImage(named: "billGates"))
        imageView.frame.size = frame.size
        addSubview(imageView)

        layer.cornerRadius = 8;
        layer.shadowOffset = CGSizeMake(7, 7);
        layer.shadowRadius = 5;
        layer.shadowOpacity = 0.5;
    }
    
    func dragged(gestureRecognizer: UIPanGestureRecognizer) {
        // TODO: write logic 
        print("dragged")
        
        let xDistance:CGFloat = gestureRecognizer.translationInView(self).x
        let yDistance:CGFloat = gestureRecognizer.translationInView(self).y

        print(xDistance)
        print(yDistance)
        
        switch (gestureRecognizer.state) {
            case UIGestureRecognizerState.Began:
                print("state began")
                originalPoint = self.center
            case UIGestureRecognizerState.Changed:
                print("state changed")
                let rotationStrength = min(xDistance / 320, 1) as CGFloat
                let rotationAngle : CGFloat =  CGFloat(2.0 * M_PI) * rotationStrength / 16
                let scaleStrength = 1 - fabsf(Float(rotationStrength)) / 4
                let scale = CGFloat(max(scaleStrength, 0.93))
                self.center = CGPointMake(originalPoint.x + xDistance, self.originalPoint.y + yDistance)
                let transform = CGAffineTransformMakeRotation(rotationAngle)
                let scaleTransform = CGAffineTransformScale(transform, scale, scale);
                self.transform = scaleTransform;
            case UIGestureRecognizerState.Ended:
                resetCardPositionAndScale()
            default:
                break
        }
        
    }
    
    private func resetCardPositionAndScale() {
        UIView.animateWithDuration(0.2) { () -> Void in
            self.center = self.originalPoint
            self.transform = CGAffineTransformMakeRotation(0)
        }
    }
    
    deinit {
        print("removing pangesture at deinit")
        removeGestureRecognizer(panGestureRecognizer)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
