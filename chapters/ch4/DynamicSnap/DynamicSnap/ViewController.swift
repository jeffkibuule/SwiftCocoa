//
//  ViewController.swift
//  DynamicSnap
//
//  Created by Joefrey Kibuule on 1/10/15.
//  Copyright (c) 2015 Joefrey Kibuule. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    var dynamicAnimator: UIDynamicAnimator?
    var snap: UISnapBehavior?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dynamicAnimator = UIDynamicAnimator(referenceView: self.view)
    }

    @IBAction func tapped(sender: AnyObject) {
        // getting the tap location
        let tap = sender as UITapGestureRecognizer
        let point = tap.locationInView(self.view)
        
        // removing the previous snapping and adding the new one
        self.dynamicAnimator?.removeBehavior(self.snap)
        self.snap = UISnapBehavior(item: self.imageView, snapToPoint: point)
        self.dynamicAnimator?.addBehavior(self.snap)
    }
}

