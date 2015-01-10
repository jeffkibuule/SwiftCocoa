//
//  ViewController.swift
//  DynamicGravity
//
//  Created by Joefrey Kibuule on 1/10/15.
//  Copyright (c) 2015 Joefrey Kibuule. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    var dynamicAnimator = UIDynamicAnimator()

    override func viewDidLoad() {
        super.viewDidLoad()
         dynamicAnimator = UIDynamicAnimator(referenceView: self.view)
        
        // creating and adding a gravity behavior
        let gravityBehavior = UIGravityBehavior(items: [self.imageView])
        dynamicAnimator.addBehavior(gravityBehavior)
        
        // creating and adding a collision behavior
        let collisionBehavior = UICollisionBehavior(items: [self.imageView])
        collisionBehavior.translatesReferenceBoundsIntoBoundary = true
        dynamicAnimator.addBehavior(collisionBehavior)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

