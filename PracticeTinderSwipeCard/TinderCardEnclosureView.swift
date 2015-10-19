//
//  TinderCardEnclosureView.swift
//  PracticeTinderSwipeCard
//
//  Created by Terry Bu on 10/19/15.
//  Copyright © 2015 Terry Bu. All rights reserved.
//

import UIKit

class TinderCardEnclosureView: UIView {

    var draggableView: TinderCardDraggableView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.whiteColor()

        loadDraggableView()
    }
    
    func loadDraggableView() {
        draggableView = TinderCardDraggableView()
        addSubview(draggableView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        draggableView.frame = CGRectMake(60, 60, self.frame.size.width * 0.7, 400)
        draggableView.center = self.center
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
