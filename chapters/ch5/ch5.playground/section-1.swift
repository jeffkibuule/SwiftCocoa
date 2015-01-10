// Playground - noun: a place where people can play

import UIKit

let aCloser: Void -> Int = { return 1 }
aCloser() // returns 1

// In this code, aViewController and anotherViewController
// are both UIViewControllers

// Sliode up a view controller, and then when the slide animation is 
// finished, change it's view's background color to yellow

/*
aViewController.presentViewController(anotherViewController, animated: true) {
    // This closer is run after the animation is finished
    anotherViewController.view.backgroundColor = UIColor.yellowColor()
} */

// Filter an array of strings down to only strings that begin with the word
// "Apple"
let array = ["Orange", "Apple", "Apple Juice"]
let filteredArray = array.filter() {
    return $0.hasPrefix("Apple")
}
filteredArray // filteredArray now contains "Apple", "Apple Juice"

var mainQueue = NSOperationQueue.mainQueue()
mainQueue.addOperationWithBlock() {
    // Add code here
}

// Creating a new queue (will run on a background thread, probably)
var backgroundQueue = NSOperationQueue()

mainQueue.addOperationWithBlock() {
    println("This operation ran on the main queue!")
}

backgroundQueue.addOperationWithBlock() {
    println("This operation ran on another queue!")
}

backgroundQueue.addOperationWithBlock() {
    // Do some work in the background
    println("I'm on the background queue")
    
    // Schedule a block on the main queue
    mainQueue.addOperationWithBlock() {
        println("I'm on the main queue")
        // GUI work can safely be done here.
    }
}


