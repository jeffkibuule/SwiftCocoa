//
//  FaviconTableViewCell.swift
//  OperationQueues
//
//  Created by Joefrey Kibuule on 1/10/15.
//  Copyright (c) 2015 Joefrey Kibuule. All rights reserved.
//

import UIKit

class FaviconTableViewCell: UITableViewCell {
    
    // The operating queue to run the download's completion handler
    var operationQueue: NSOperationQueue?
    
    // The URL that this cell shows
    var url: NSURL? {
        
        // When the URL changes, run this code.
        didSet {
            // We've just been given a URL, so create a request
            var request = NSURLRequest(URL: self.url!)
            
            // Display this text.
            self.textLabel?.text = self.url?.host
            
            // Fire off the requeust, and give it a completion handler
            // plus a queue to run on
            NSURLConnection.sendAsynchronousRequest(request, queue: self.operationQueue!, completionHandler: {
                (response: NSURLResponse!, data: NSData!, error: NSError!) in
                // The 'data' variable now contains the loaded data;
                // turn it into an image
                var image = UIImage(data: data)
                
                // Updates to the UI have to be done on the main queue.
                NSOperationQueue.mainQueue().addOperationWithBlock() {
                    // Give the image view the loaded image
                    self.imageView?.image = image
                    
                    // The image view has probably changed size because of
                    // the new image, so we need to re-layout the cell.
                    self.setNeedsLayout()
                }
            })
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
