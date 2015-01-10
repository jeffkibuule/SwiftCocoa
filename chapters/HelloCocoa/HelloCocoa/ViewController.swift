//
//  ViewController.swift
//  HelloCocoa
//
//  Created by Joefrey Kibuule on 1/9/15.
//  Copyright (c) 2015 Joefrey Kibuule. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var helloButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showAlert(sender: AnyObject) {
        var alert = UIAlertController(title: "Hello!", message: "Hello, world!", preferredStyle: .Alert)
        alert.addAction(UIAlertAction(title: "Close", style: .Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
        self.helloButton.setTitle("Clicked", forState: .Normal)
    }
}

