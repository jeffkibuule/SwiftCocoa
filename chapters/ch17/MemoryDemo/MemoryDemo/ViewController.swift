//
//  ViewController.swift
//  MemoryDemo
//
//  Created by Joefrey Kibuule on 1/10/15.
//  Copyright (c) 2015 Joefrey Kibuule. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var imagesContainer: UIScrollView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    func loadPageWithNumber(number: NSInteger) {
        // If an image view already exists for this page, don't do anything
        if self.imagesContainer.viewWithTag(number) != nil {
            return
        }
        
        // Get the image for this page
        let image = self.imageWithNumber(number)
        
        // Create and prepare the image view for this page
        let imageView = UIImageView(image: image)
        var imageViewFrame = self.imagesContainer.bounds
        imageViewFrame.origin.x = imageViewFrame.size.width * CGFloat(number - 1)
        imageView.frame = imageViewFrame
        
        // Add it to the scroll view
        self.imagesContainer.addSubview(imageView)
        
        // Mark this new image view with a tag so that we can easily refer to it later
        imageView.tag = number
    }
    
    func imageWithNumber(number: Int) -> UIImage {
        // Inset the image by 30px so that we can see the rounded corners
        var imageRect = self.imagesContainer.frame
        imageRect.inset(dx: 30, dy: 30)
        
        UIGraphicsBeginImageContext(imageRect.size)
        
        // Draw a rounded rectangle
        let path = UIBezierPath(roundedRect: imageRect, cornerRadius: 10)
        
        path.lineWidth = 20
        
        UIColor.darkGrayColor().setStroke()
        UIColor.lightGrayColor().setFill()
        
        path.fill()
        path.stroke()
        
        // Draw the number
        let label = "\(number)"
        
        let font = UIFont.systemFontOfSize(50)
        let labelPoint = CGPoint(x: 50, y: 50)
        
        UIColor.whiteColor().setFill()
        
        let labelAttributes = [NSFontAttributeName: font]
        label.drawAtPoint(labelPoint, withAttributes: labelAttributes)
        
        // Get the finished image and return it
        let returnedImage = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        return returnedImage
    }
    
    override func viewDidLayoutSubviews() {
        // Create 10,000 images
        let pageCount = 10000
        
        self.updatePages()
        
        // tell the scroll view about its new content size
        var contentSize = CGSize()
        contentSize.height = self.imagesContainer.bounds.size.height
        contentSize.width = self.imagesContainer.bounds.size.width * CGFloat(pageCount)
        
        self.imagesContainer.contentSize = contentSize
    }
    
    func updatePages() {
        var pageNumber = Int(imagesContainer.contentOffset.x / imagesContainer.bounds.size.width + 1)
        
        // Load the image previous to this oone
        self.loadPageWithNumber(pageNumber - 1)
        
        // Load the current page
        self.loadPageWithNumber(pageNumber)
        
        // Load the next page
        self.loadPageWithNumber(pageNumber + 1)
        
        // Remove all image views that aren't on this page or the pages adjacent to int
        for imageView in imagesContainer.subviews {
            if imageView.tag < pageNumber - 1 || imageView.tag > pageNumber + 1 {
                imageView.removeFromSuperview()
            }
        }
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        self.updatePages()
    }
}

