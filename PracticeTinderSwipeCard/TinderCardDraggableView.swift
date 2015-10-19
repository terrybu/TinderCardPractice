//
//  TinderCardDraggableView.swift
//  PracticeTinderSwipeCard
//
//  Created by Terry Bu on 10/19/15.
//  Copyright © 2015 Terry Bu. All rights reserved.
//

import UIKit

class TinderCardDraggableView: UIView {
    
    var panGestureRecognizer: UIPanGestureRecognizer!
    
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
    }
    
    deinit {
        print("removing pangesture at deinit")
        removeGestureRecognizer(panGestureRecognizer)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
